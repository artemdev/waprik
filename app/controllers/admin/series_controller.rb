class Admin::SeriesController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'

	FTP_PATH = "public/ftp/serials/"

	def new 
		@serial = Serial.find(params[:id])
		@serie = @serial.series.build
		1.times { @serie.files.build }
		@serie.build_season
  	@files = Dir.glob(FTP_PATH + "**/*").sort
  	@qualities = FilmQuality.all
	end

	def create
		@serial = Serial.find(params[:serial_id])
		@serie = @serial.series.new(params[:series].except("files_attributes"))
		if @serie.save
			if params[:series][:files_attributes]
				original_path = File.expand_path(params[:series][:files_attributes]["0"][:attach])
				SerialsWorker.perform_async(@serie.id, original_path, params[:series][:files_attributes]["0"][:quality], 4)
			end
			flash[:success] = "Успех! Серия добавлена"
			redirect_to @serial
		else
			render :new
		end
	end

  def edit
  	@serial = Serial.find(params[:id])
  	@files = Dir.glob(FTP_PATH + "*").sort
  	@qualities = FilmQuality.all
  end	

  def update
  	@series = Series.find(params[:id])
  	if @series.update_attributes(params[:series])
			flash[:success] = "Серия успешно обновлена"
  		redirect_to action: 'edit', id: @series.serial.id
  	else
  		render 'edit'
  	end
  end

  def destroy
		series = Series.find(params[:id])
		@serial_id = series.serial.id
		series.destroy
		redirect_to edit_admin_series_path(series.serial)
  end

 	def delete_file
		@series = Series.find(params[:id])
		version = params[:version]
		case version
			when 'low_3gp'
				@series.remove_low_3gp!
				@series.save
			when 'mp4_176'
				@series.remove_mp4_176!
				@series.save
			when 'mp4_320'
				@series.remove_mp4_320!
				@series.save
			when 'mp4_640'
				@series.remove_mp4_640!
				@series.save
		end
		redirect_to(:action => 'edit', :id => @series.serial.id)
	end
end
