require 'nokogiri'
class Youtube::Search

	SEARCH_DOMAIN = "https://www.youtube.com/results?search_query="
	DOMAIN = "http://www.youtube.com"
	ENCODING = 'UTF-8'

	def initialize keywords, page=1
		keywords = keywords.parameterize.gsub(" ", "+")
		page = "&page=#{page}"
		@url = SEARCH_DOMAIN + keywords + page
		@page = Nokogiri::HTML(open(@url), nil, ENCODING)
	end

	def page
		@page
	end

	def videos
		results = []
		Struct.new("Video", :name, :video_id, :image, :time)
		@page.css("#results .yt-lockup-video").each do |result|
			video = Struct::Video.new
			video.name = result.at_css("h3.yt-lockup-title a").text if result.at_css("h3.yt-lockup-title a")
			# video.video_url = DOMAIN + result.at_css("h3.yt-lockup-title a")[:href] if result.at_css("h3.yt-lockup-title a")
			video.video_id = result.at_css("h3.yt-lockup-title a")[:href].split("watch?v=").last if result.at_css("h3.yt-lockup-title a")
			video.image = "http://" + result.at_css(".video-thumb img")[:src].split("//").last if result.at_css(".video-thumb img")
			video.time = result.at_css("span.video-time").text if result.at_css("span.video-time")
			results << video
		end
		results
	end

	# def results
	# 	results = []
	# 	@page.css("#results .yt-lockup-video").each do |ellement|
	# 		# title = ellement.at_css("h3.yt-lockup-title a").text if result.at_css("h3.yt-lockup-title a")
	# 		# url = DOMAIN + ellement.at_css("h3.yt-lockup-title a")[:href] if result.at_css("h3.yt-lockup-title a")
	# 		if ellement.at_css("h3.yt-lockup-title a")
	# 			id = ellement.at_css("h3.yt-lockup-title a")[:href].split("/watch?v=").last
	# 			youtube_video = Youtube::Video.new(id)
	# 			results << YoutubeVideo.find_or_create_from(youtube_video)
	# 		end
	# 	end
	# 	results
	# end

	def save!
	end



end