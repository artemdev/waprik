require 'open-uri'
class Admin::FilmsController < ApplicationController
  layout 'admin'
	
	before_filter :confirm_logged_in
	before_filter :find_film, only: [:edit, :update, :show, :destroy]
	before_filter :find_film_directors, only: [:edit, :update]
	before_filter :find_film_actors, only: [:edit, :update]
  before_filter :set_collections, only: ['new', 'edit']

  CAMRip = 1

	def index
		@films = Film.latest.paginate(page: params[:page], per_page: 30)
		@camrip = FilmQuality.find(CAMRip)
	end

	def edit
		# @film, @film_directors, # @film_actors
		@genres = FilmGenre.all
	end

	def update
		# @film, @film_directors
		@genres = FilmGenre.all
		@film.add_actors(params[:film][:new_actors])
		@film.add_directors(params[:film][:new_directors])
		@film.add_genres(params[:film][:selected_genres])
		@film.set_collection(params[:film][:new_collection]) if params[:film][:new_collection]
		if params[:film][:trailer_filename]
			thrailer = @film.trailers.new
			thrailer.filename.store! params[:film][:trailer_filename]
			thrailer.filesize = thrailer.filename.size
			thrailer.save
		end
		if @film.update_attributes(params[:film])
			flash[:success] = "Фильм успешно обновлен"
			redirect_to admin_films_path
		else
			render 'new'
		end
	end


	def find
	end

	def list
		@movies = ParseBrbSearch.new(params[:keyword]).results
	end

	def new
		@movie = ParseBrbFilm.new params[:movie_url]
		@film = Film.new
		# title
		if @movie.ru_title.present? && @movie.eng_title.present?
			@film.title = "#{@movie.ru_title} / #{@movie.eng_title}"
		elsif @movie.ru_title.present?
			@film.title = @movie.ru_title
		end
		@film.ru_title = @movie.ru_title if @movie.ru_title
		@film.en_title = @movie.eng_title if @movie.eng_title
		# info
		@film.about = @movie.description if @movie.description 
		@film.year = @movie.years if @movie.years
		@film.remote_cover_url = @movie.cover if @movie.cover
		@film.selected_genres = @movie.genres.join("\n") if @movie.genres
		@film.new_actors = @movie.actors.join("\n") if @movie.actors && !@movie.actors.empty?
		@film.new_directors = @movie.directors.join("\n") if @movie.directors && !@movie.directors.empty?
		@genres = FilmGenre.all
		@directors = @film.directors
		@actors = @film.actors
		@film.common_films = @movie.common_films
		@film.brb_url = params[:movie_url]
	end

	def create
		@film = Film.new(params[:film])
		@common_films = params[:film][:common_films]
		@directors = @film.directors
		@actors = @film.actors
		@genres = FilmGenre.all
		@film.add_actors(params[:film][:new_actors])
		@film.add_directors(params[:film][:new_directors])
		@film.add_genres(params[:film][:selected_genres])
		@film.ru_title = params[:film][:ru_title] if params[:film][:ru_title].present?
		@film.en_title = params[:film][:en_title] if params[:film][:en_title].present?
		@film.cover = File.open(params[:film][:new_cover])
		@film.set_collection(params[:film][:new_collection]) if params[:film][:new_collection]
		@film.brb_url = params[:film][:brb_url]
		@film.create_recomendations!
		if @film.save
			flash[:success] = "Фильм успешно добавлен"
			redirect_to new_admin_film_file_path(film_id: @film.id)
		else
			render :new
		end
	end

	def show
		# @film
	end

	def destroy_actor
		@film = Film.find(params[:film_id])
		@actor = FilmActor.find(params[:actor_id])
		@film.destroy_director(@actor)
		redirect_to :back
	end

	def destroy_director
		@film = Film.find(params[:film_id])
		@director = FilmDirector.find(params[:director_id])
		@film.destroy_director(@director)
		redirect_to :back
	end

	def destroy
		# @film
		# удаление всех файлов к фильму
		@film.files.each do |file|
			file.film_parts.each {|part| part.remove_real_name! }
			file.remove_real_name!
		end
		# удаление фильма
		@film.destroy
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	def add_to_favourites
		@film = Film.find(params[:id])
		@film.update_attributes!(is_favourite: true)
		redirect_to admin_films_path
	end

	def remove_from_favourites
		@film = Film.find(params[:id])
		@film.update_attributes!(is_favourite: false)
		redirect_to admin_films_path
	end

	def thrailers
		films = Film.latest
		@films = []
		films.each do |film|
			@films << film if film.files.empty? && film.trailers.any?
		end
	end


	def make_social
		film = Film.find(prams[:id])
		film.make_social!
	end

	private

	def find_film
		@film = Film.find(params[:id])	
	end

	def find_film_directors
		@directors = @film.directors		
	end

	def find_film_actors
		@actors = @film.actors		
	end

	def set_collections
		@collections = Collection.all	
	end

end
