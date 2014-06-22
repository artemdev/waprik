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
			when "64"
				send_file(@track.path.path + "_64")
			when "128"
				send_file(@track.path.path + "_128")
		end
	end
end
