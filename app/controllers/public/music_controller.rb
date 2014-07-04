class Public::MusicController < ApplicationController
	layout 'mobile'

	def index
		@tracks = Mp3File.all
	end

	def show
		@track = Mp3File.find(params[:id])
	end

	# скачивание состоит из 2-х действий, чтобы избежать неправильного подсчета скачиваний
	def download
		@track = Mp3File.find(params[:id])
		@track.downloads += 1
		@track.save
		redirect_to(action: "get_file", id: @track.id, bitrate: params[:bitrate])
	end

	def get_file
		@track = Mp3File.find(params[:id])
		@bitrate = @track.bitrates.find_by_file_bitrate(params[:bitrate])
		if @track.path.path
			case params[:bitrate]
				when "128"
					send_file "#{@track.path.path}_128.mp3", type: 'audio/mpeg', filename: @track.fname
				when "64"
					send_file "#{@track.path.path}_64.mp3", type: 'audio/mpeg', filename: @track.fname
				when "32"
					send_file "#{@track.path.path}_32.mp3", type: 'audio/mpeg', filename: @track.fname
			end
		elsif @bitrate.file 
			send_file @bitrate.file.path, type: 'audio/mpeg', filename: (@track.fname + '.mp3')
		end
	end

	def test
		send_file "#{Rails.root}/public/uploads/test.mp3", filename: "test.mp3"
	end
end
