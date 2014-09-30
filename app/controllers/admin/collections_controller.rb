class Admin::CollectionsController < ApplicationController
	before_filter :confirm_logged_in
	
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
		@collection = Collection.find_by_permalink!(params[:id])
		if @collection.with_music && @collection.tracks.latest.first
			# дата самых новых треков
			@date = @collection.tracks.latest.first.created_at
			# самые новые треки
			@latest_tracks = @collection.tracks.where(created_at: @date.at_beginning_of_day..@date.end_of_day)
			# все треки кроме самых новых
			@tracks = @collection.tracks.without_new(@date).paginate(page: params[:page], per_page: 20)
		elsif @collection.with_films && @collection.films.latest.first
			# дата самых новых фильмов
			@date = @collection.films.latest.first.created_at
			# самые новые фильмы
			@latest_films = @collection.films.where(created_at: @date.at_beginning_of_day..@date.end_of_day)
			# все фильмы кроме самых новых
			@films = @collection.films.without_new(@date).paginate(page: params[:page], per_page: 20)
		end
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
