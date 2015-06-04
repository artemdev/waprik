require 'nokogiri'
class Youtube

	SEARCH_DOMAIN = "https://www.youtube.com/results?search_query="
	DOMAIN = "http://www.youtube.com"
	ENCODING = 'UTF-8'
	def initialize keywords, page
		keywords = keywords.parameterize.gsub(" ", "+")
		page = "&page=3"
		@url = SEARCH_DOMAIN + keywords + page
		@page = Nokogiri::HTML(open(@url), nil, ENCODING)
	end

	def page
		@page
	end

	def results
		results = []
		video = Struct.new("Video", :title, :url, :img, :time)
		@page.css("#results .yt-lockup-video").each do |result|
			video = Struct::Video.new
			video.title = result.at_css("h3.yt-lockup-title a").text if result.at_css("h3.yt-lockup-title a")
			video.url = DOMAIN + result.at_css("h3.yt-lockup-title a")[:href] if result.at_css("h3.yt-lockup-title a")
			video.img = "http://" + result.at_css(".video-thumb img")[:src].split("//").last if result.at_css(".video-thumb img")
			video.time = result.at_css("span.video-time").text if result.at_css("span.video-time")
			results << video
		end
		results
	end



end