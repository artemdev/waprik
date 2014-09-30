require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

class VkPost
	SERVICE_URL = 'http://iplayer.fm/'

	def initialize url=""
		@doc = Nokogiri::HTML(open(url))
		@post_id = url.split('-').last
	end

	# def tracks
	# 	@doc.css("#wpt-#{@post_id}").each do |track|
	# 		# download div
	# 		track.css("input.audio_info2000070475_310793050_-27895931_1101053")
	# 	end
	# end

	def title
		@doc.at_css(".pi_text").text
	end

	def image
		@doc.at_css("img.wi_img")['src']
	end

	def tracks
		tracks_urls = []
		@doc.css(".wi_body").each do |body|
			body.css(".medias_row").each do |row|
				artist = row.at_css(".medias_audio_artist").text.strip
				title = row.at_css(".medias_audio_title").text.split('(').shift.gsub('–', '-')
				track = artist + title
				agent = Mechanize.new
				form = agent.get(SERVICE_URL).forms.first
				form.q = track
				# страница результатов поискв
				audios = form.submit
				# ссылка для скачивания
				url = audios.at(".playlist-down")['href']
				tracks_urls << [artist, track, url]
			end
		end
		tracks_urls
	end

	def doc
		@doc
	end

end
puts VkPost.new('http://vk.com/exclusive_muzic?w=wall-27895931_1103191').image