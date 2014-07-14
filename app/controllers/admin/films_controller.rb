require 'open-uri'
class Admin::FilmsController < ApplicationController
	layout 'admin'
	
	before_filter :confirm_logged_in
	before_filter :find_film, only: [:edit, :update, :show, :destroy]
	before_filter :find_film_directors, only: [:edit, :update]
	before_filter :find_film_actors, only: [:edit, :update]

	def index
		@films = Film.latest.paginate(page: params[:page], per_page: 30)
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
		s = Kinopoisk::Search.new(params[:keyword])
		@movies = s.movies
	end

	def new
		@movie = Kinopoisk::Movie.new(params[:movie_title])
		@film = Film.new
		# title
		if @movie.title && !@movie.title_en.empty? && !@movie.title_en.nil?
			@film.title = "#{@movie.title} / #{@movie.title_en}"
		elsif @movie.title
			@film.title = @movie.title
		end
		@film.ru_title = @movie.title
		@film.en_title = @movie.title_en
		# info
		@film.about = @movie.description if @movie.description 
		@film.year = @movie.year if @movie.year 
		@film.cover = @movie.poster if @movie.poster
		@film.world_estimate = @movie.imdb_rating if @movie.imdb_rating
		@film.cis_estimate = @movie.rating if @movie.rating 
		@film.selected_genres = @movie.genres.join("\n") if @movie.genres
		@film.new_actors = @movie.actors.join("\n") if @movie.actors && !@movie.actors.empty?
		@film.new_directors = @movie.directors.join("\n") if @movie.directors && !@movie.directors.empty?
		@film.duration_hours = @movie.length.divmod(60).first
		@film.duration_minutes = @movie.length.divmod(60).last
		@genres = FilmGenre.all
		@directors = @film.directors
		@actors = @film.actors
	end

	def create
		@movie = Kinopoisk::Movie.new(params[:movie_title]) # for cover
		@film = Film.new(params[:film])
		@directors = @film.directors
		@actors = @film.actors
		@genres = FilmGenre.all
		@film.add_actors(params[:film][:new_actors])
		@film.add_directors(params[:film][:new_directors])
		@film.add_genres(params[:film][:selected_genres])
		@film.remote_cover_url = @movie.poster
		@film.ru_title = @movie.title
		@film.en_title = @movie.title_en
		@film.permalink = Russian.translit(@movie.title.gsub(' ', '_').gsub('&', 'ft').gsub(':', '-').delete('.').delete('»').delete('«').delete('(').delete(')').delete('/').delete('?').delete('!'))
		if @film.save
			flash[:success] = "Фильм успешно добавлен"
			redirect_to new_admin_film_file_path(film_id: @film.id)
		else
			render 'new'
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
		@film.update_attributes(is_favourite: true)
		redirect_to admin_films_path
	end

	def remove_from_favourites
		@film = Film.find(params[:id])
		@film.update_attributes(is_favourite: false)
		redirect_to admin_films_path
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

end
