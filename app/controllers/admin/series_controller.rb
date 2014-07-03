class Admin::SeriesController < ApplicationController

	before_filter :confirm_logged_in

	FTP_PATH = "public/ftp/serials/"

	def new 
		@serial = Serial.find(params[:id])
		@series = @serial.series.build
  	@files = Dir.glob(FTP_PATH + "*").sort
	end

	def create
		@serial = Serial.find(params[:serial_id])
		@series = Series.new(params[:series])

		@series.serial = @serial

		@series.low_3gp = File.open(params[:series][:ftp_low_3gp]) unless params[:series][:ftp_low_3gp].nil? || params[:series][:ftp_low_3gp].empty?
		@series.mp4_320 = File.open(params[:series][:ftp_mp4_320]) unless params[:series][:ftp_mp4_320].nil? || params[:series][:ftp_mp4_320].empty?
		@series.mp4_640 = File.open(params[:series][:ftp_mp4_640]) unless params[:series][:ftp_mp4_640].nil? || params[:series][:ftp_mp4_640].empty?

		if @series.save
			@serial.save
			File.delete(params[:series][:ftp_low_3gp]) unless params[:series][:ftp_low_3gp].nil? || params[:series][:ftp_low_3gp].empty?
			File.delete(params[:series][:ftp_mp4_320]) unless params[:series][:ftp_mp4_320].nil? || params[:series][:ftp_mp4_320].empty?
			File.delete(params[:series][:ftp_mp4_640]) unless params[:series][:ftp_mp4_640].nil? || params[:series][:ftp_mp4_640].empty?
			flash[:success] = "Сериал успешно добавлен"
			redirect_to edit_admin_serial_path(@serial.id)
		else
			render(new_admin_serial_path)
		end		
	end

  def edit
  	@serial = Serial.find(params[:id])
  	@files = Dir.glob(FTP_PATH + "*").sort
  end	

  def update
  	@series = Series.find(params[:id])

		@series.low_3gp = File.open(params[:series][:ftp_low_3gp]) unless params[:series][:ftp_low_3gp].nil? || params[:series][:ftp_low_3gp].empty?
		@series.mp4_320 = File.open(params[:series][:ftp_mp4_320]) unless params[:series][:ftp_mp4_320].nil? || params[:series][:ftp_mp4_320].empty?
		@series.mp4_640 = File.open(params[:series][:ftp_mp4_640]) unless params[:series][:ftp_mp4_640].nil? || params[:series][:ftp_mp4_640].empty?
 	
  	if @series.update_attributes(params[:series])
  		File.delete(params[:series][:ftp_low_3gp]) unless params[:series][:ftp_low_3gp].nil? || params[:series][:ftp_low_3gp].empty?
			File.delete(params[:series][:ftp_mp4_320]) unless params[:series][:ftp_mp4_320].nil? || params[:series][:ftp_mp4_320].empty?
			File.delete(params[:series][:ftp_mp4_640]) unless params[:series][:ftp_mp4_640].nil? || params[:series][:ftp_mp4_640].empty?
  		flash[:success] = "Серия успешно обновлена"
  		redirect_to action: 'edit', id: @series.serial.id
  	else
  		render 'edit'
  	end
  end

  def delete
		series = Series.find(params[:id])
		@serial_id = series.serial.id
		series.destroy
		redirect_to(controller: 'serials', action: 'edit', :id => @serial_id)
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
