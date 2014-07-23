class Admin::CollectionsController < ApplicationController
	before_filter :confirm_logged_in
	
	layout 'admin'

	def index
		@collections = Collection.all
		case params[:section]
			when "with_music"
				@collections = Collection.with_music
			when "with_videos"
				@collections = Collection.with_videos
			when "with_films"
				@collections = Collection.with_films
		end
	end

	def new
		@collection = Collection.new
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

	end

	def edit
		@collection = Collection.find(params[:id])
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

end
