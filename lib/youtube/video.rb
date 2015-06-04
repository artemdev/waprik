require 'nokogiri'
require 'open-uri'
class Youtube::Video

	ENCODING = 'UTF-8'

	SEARCH_DOMAIN = "https://www.youtube.com/results?search_query="
	DOMAIN = "http://www.youtube.com"
	VIDEO_DOMAIN = "https://www.youtube.com/watch?v="
	DL_LINKS_DOMAIN = "http://file2hd.com/Default.aspx?url=https://www.youtube.com/watch?v="


	def initialize id=nil
		@id = id
		@url = VIDEO_DOMAIN + id
		@dl_url = DL_LINKS_DOMAIN + id
		begin
			@page = Nokogiri::HTML(open(@url), nil, ENCODING)
			rescue OpenURI::HTTPError => e
		end

		begin
			@dl_page = Nokogiri::HTML(open(@dl_url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.121 Safari/535.2'), nil, ENCODING)
			rescue OpenURI::HTTPError => e
		end
	end

	def dl_page
		@dl_page
	end

	def page
		@page
	end

	def id
		@id
	end

	def url
		@url
	end

	def name
		page.at_css("span#eow-title").text.strip if page && page.at_css("span#eow-title")
	end

	def description
		page.at_css("#eow-description").text if page && page.at_css("#eow-description")
	end

	def time
		time = page.at_css(".video-time")
		time.text.strip if time
	end

	def image
		page.at_css("link[@itemprop=thumbnailUrl]")[:href] if page && page.at_css("link[@itemprop=thumbnailUrl]")
	end

	def views
		page.at_css(".watch-view-count").text if page && page.at_css(".watch-view-count")
	end

	def dl_links
		dl_links = []
		dl_page.css("span#filelist a").each do |a|
			links << a if a.text.include?("[File2HD.com]")
		end
		dl_links
	end

	def save!
		if page
			video = YoutubeVideo.find_by_source_url(url)
			video ||= YoutubeVideo.find_or_create_from self
		end
	end



end