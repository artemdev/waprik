require 'youtube/video'
require 'youtube/search'
class VideosController < ApplicationController
	layout 'mobile'

	def index
		@videos = []
		if params[:keywords]
			@videos = Youtube::Search.new(params[:keywords]).videos
		end
	end

	# система парсит или находит товар
	def show
		@youtube_video = Youtube::Video.new(params[:id])
		@video = YoutubeVideo.find_or_create_from(@youtube_video)
	end

end
