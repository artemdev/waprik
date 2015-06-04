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
		@video =  if youtube_video = YoutubeVideo.find_by_source_url("https://www.youtube.com/watch?v=" + params[:id])
								youtube_video
							else
								youtube_video = Youtube::Video.new(params[:id])
								YoutubeVideo.find_or_create_from(youtube_video)
							end
	end

end
