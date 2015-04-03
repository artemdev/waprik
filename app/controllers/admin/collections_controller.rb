class Admin::CollectionsController < ApplicationController
	before_filter :confirm_logged_in!
  before_filter :admin?
  
	layout 'admin'

	def index
		@collections = Collection.all
		case params[:section]
			when "with_music"
				@collections = []
				@all_collections = Collection.all
				@all_collections.each {|c| @collections << c if c.with_music }
			when "with_videos"
				@collections = []
				@all_collections = Collection.all
				@all_collections.each {|c| @collections << c if c.with_videos }
			when "with_films"
				@collections = []
				@all_collections = Collection.all
				@all_collections.each {|c| @collections << c if c.with_films }
		end
	end

	def new
		@collection = Collection.new
		10.times { @collection.tracks.new }
	end

	def create
		@collection = Collection.new(params[:collection])
		if @collection.save
			flash[:success] = "Подборка успешно создана"
			redirect_to admin_collections_path
		else
			render :new
		end
	end

	def show
		@collection = Collection.find_by_permalink(params[:id])
		@tracks = @collection.tracks.paginate(page: params[:page], per_page: 10)
		@films = @collection.films.paginate(page: params[:page], per_page: 10)
	end

	def edit
		@collection = Collection.find_by_permalink(params[:id])
		@track = @collection.tracks.new
	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes!(params[:collection])
			flash[:success] = "Подборка обновлена"
			redirect_to admin_collections_path
		else
			render :edit
		end
	end

	def destroy
		Collection.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to admin_collections_path }
			format.js
		end
	end

	def refresh
		@collection = Collection.find(params[:id])
		@films = Film.search(params[:query]) if params[:query]
		@tracks = Mp3File.search(params[:query]) if params[:query]
	end

	def add_film
		if (film = find_film) && (collection = find_collection)
			if collection.films.include?(film)
				notice = 'фильм уже есть в коллекции'
			else
				collection.films << film
				notice = 'фильм успешно добавлен'
			end
		elsif !find_collection
			notice = 'не удалось найти коллекцию'
		elsif !find_film
			notice = 'не удалось найти фильм'
		end
		redirect_to admin_collection_path(collection.permalink), notice: notice
	end

	def add_track
		if (track = find_track) && (collection = find_collection)
			if collection.tracks.include?(track)
				notice = 'трек уже есть в коллекции'
			else
				collection.tracks << track
				notice = 'трек успешно добавлен'
			end
		elsif !find_collection
			notice = 'не удалось найти коллекцию'
		elsif !find_track
			notice = 'не удалось найти трек'
		end
		redirect_to admin_collection_path(collection.permalink), notice: notice
	end

	def remove_from
		collection = find_collection
		film = find_film
		track = find_track
		if collection && film
			film.collections.delete(collection)
			notice = "фильм удален из коллекции"
		elsif collection && track
			track.collections.delete(collection)
			notice = "трек удален из коллекции"
		end
		redirect_to admin_collection_path(collection.permalink), notice: notice
	end

private

	def find_collection
		Collection.find(params[:id])
	end

	def find_film
		Film.find(params[:film_id]) if params[:film_id]
	end


	def find_track
		Mp3File.find(params[:track_id]) if params[:track_id]
	end
end
