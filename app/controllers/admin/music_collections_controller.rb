class Admin::MusicCollectionsController < ApplicationController
	layout 'web'

	def index
		@collections = MusicCollection.all
	end

	def new
		@collection = MusicCollection.new
	end

	def create
		@collection = MusicCollection.new(params[:music_collection])
		if @collection.save
			redirect_to edit_admin_music_collection_path(@collection), notice: 'подборка успешно обновлена!'
		else
			render :new
		end	
	end

	def edit
		@collection = MusicCollection.find(params[:id])
		@films = Film.all
		@found_films = Film.search(params[:film_name]) if params[:film_name]
	end

	def update
		@collection = MusicCollection.find(params[:id])
		if @collection.update_attributes(params[:collection])
			redirect_to :back, notice: 'подборка успешно обновлена!'
		else
			render :edit
		end
	end

	def destroy
		@collection = MusicCollection.find(params[:id])
		@collection.destroy
	end

	def add_content
		@collection = Collection.find(params[:id])
		@film = Film.find(params[:film_id])
		@collection.films << @film unless @collection.films.include?(@film)
		redirect_to :back, notice: "#{@film} успешно добавлен"
	end

end
