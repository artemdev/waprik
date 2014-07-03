class Public::MusicController < ApplicationController
	layout 'mobile'

	def index
		@tracks = Mp3File.all
	end

	def show
		@track = Mp3File.find(params[:id])
	end

	def download
		@track = Mp3File.find(params[:id])
		case params[:bitrate]
			when "128"
				if @track.path.path
					send_file "#{@track.path.path}_128.mp3", filename: @track.fname
				elsif @track.new_path.path
					send_file @track.new_path.path, filename: @track.fname
				end
			when "64"
				if @track.path.path
					send_file "#{@track.path.path}_64.mp3", filename: @track.fname
				elsif @track.new_path.path
					send_file @track.new_path.path, filename: @track.fname
				end
			when "32"
				if @track.path.path
					send_file "#{@track.path.path}_32.mp3", filename: @track.fname
				elsif @track.new_path.path
					send_file @track.new_path.path, filename: @track.fname
				end
		end
	end
end
