class Admin::CollectionGenresController < ApplicationController

	def index
		@genres = CollectionGenre.all
	end

	def show
		@genre = CollectionGenre.find(params[:id])
		if params[:collection]
			@collections = Collection.search(params[:collection][:name])
		end
	end

	def new
		@genre = CollectionGenre.new
	end

	def create
		@genre = CollectionGenre.new(params[:id])
		if @genre.save
			redirect_to admin_collection_genres_path
		else
			render 'new'
		end
	end

	def fill
		@genre = CollectionGenre.find(params[:id])
		@collection = Collection.find(params[:collection_id])
		if @genre && @collection
			@genre.collections << @collection
			redirect_to admin_collection_genre_path(@genre), notice: "Коллекция успешно добавлена"
		else
			redirect_to admin_collection_genre_path(@genre), notice: "Не удалось добавить коллекцию"
		end
	end


end
