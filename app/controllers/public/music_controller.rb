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
		@bitrate = @track.bitrates.find_by_file_bitrate(params[:bitrate])
		if @track.path.path
			case params[:bitrate]
				when "128"
					send_file "#{@track.path.path}_128.mp3", filename: (@track.fname + ".mp3")
				when "64"
					send_file "#{@track.path.path}_64.mp3", filename: (@track.fname + ".mp3")
				when "32"
					send_file "#{@track.path.path}_32.mp3", filename: (@track.fname + ".mp3")
			end
		elsif @bitrate.file 
			send_file @bitrate.file.path
		end
		@track.downloads += 1
		@track.save
	end
end
