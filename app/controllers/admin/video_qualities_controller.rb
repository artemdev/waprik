class Admin::VideoQualitiesController < ApplicationController

	def index
		@qualities = FilmQuality.all
	end


	def new
		@quality = FilmQuality.new
	end

	def create
		@quality = FilmQuality.new(params[:film_quality])
		if @quality.save
			redirect_to admin_video_qualities_path, notice: 'Формат успешно добавлен'
		else
			render :new
		end
	end

	def edit
		@quality = FilmQuality.find(params[:id])
	end

	def update
		@format = FilmQuality.find(params[:id])
		if @format.update_attributes(params[:film_quality])
			redirect_to admin_video_qualities_path, notice: 'Формат успешно обновлен'
		else
			render :edit
		end
	end

end
