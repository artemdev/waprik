class Admin::FilmsCollectionsController < ApplicationController
	layout 'admin'

	def new
	end

	def index
		@collections = FilmCollection.latest.paginate(page: params[:page], per_page: 10)
	end

	def edit
		@collection = FilmCollection.find(params[:id])
		@films = @collection.films
		@found_films = Film.search(params[:film_name]) if params[:film_name]
	end

	def create
		@collection = FilmCollection.new(params[:film_collection])
		if @collection.save
			redirect_to admin_films_collections_path
		else
			render :new
		end
	end

	def update
		@collection = FilmCollection.find(params[:id])
		if @film = Film.where(id: params[:id])
			@collection.films << @film
		end

		if @collection.update_attributes!(params[:film_collection])
			redirect_to :back, notice: 'фильм успешно обновлен'
		else
			render :edit
		end
	end

	def show
		@collection = FilmCollection.find(params[:id])
		@films = @collection.films
	end

	def add_content
		@collection = FilmCollection.find(params[:film_id])
		@film = Film.find(params[:film_id])
		@collection.films << @film
		redirect_to :back, notice: 'фильм успешно добавлен'
	end

	def destroy
		FilmCollection.find(params[:id]).destroy
		redirect_to admin_films_collections_path, notice: "коллекция успешно удалена"
	end

end
