require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'vkontakte_api'
class VkPost
	def initialize url=""
		# agent = Mechanize.new
		# agent.user_agent_alias = USER_AGENT_ALIAS
		# @doc = agent.get "http://login.vk.com/?act=login&email=#{EMAIL}&pass=#{PASS}"
		# @doc = agent.get url
		# @doc.encoding = 'utf-8'
		@post_id = "-" + url.split('-').last
		@vk = VkontakteApi::Client.new
		@post = @vk.wall.getById(posts: @post_id).first
	end

	def tracks
		urls = []
		@post.attachments.each do |a|
			urls << [a.audio.artist.strip, "#{a.audio.artist.strip} - #{a.audio.title.strip}", a.audio.url] if a.audio
		end
		urls
	end

	def title
		@post.text
	end

	def image
		@post.attachment.photo.src_big
	end

	# def tracks
	# 	audio_ids = []
	# 	audio_tracks = []
	# 	@doc.search(".wi_body").each do |div|
	# 		puts div
	# 		# puts div
	# 		# получить audio_id 
	# 		# div.search('.play_btn_wrap').each do |audio_div|
	# 		# 	audio_div.search('.play_new').each do |audio|
	# 		# 		audio_ids << audio['id'].split('play').pop
	# 		# 	end
	# 		# 	puts audio_ids
	# 		# end
	# 		# # взять название по id
	# 		# div.search('td.info').each do |block|
	# 		# 	puts block
	# 		# end
	# 		# if audio_ids.any?
	# 		# 	audio_ids.each do |id|
	# 		# 		# получить ссылку к audio_id
	# 		# 		track = div.at_css("input#audio_info#{id}")['value']
	# 		# 		audio_tracks << track
	# 		# 	end
	# 		# end
	# 		# взять id + ссылку для трека
	# 		# найти название трека по id
	# 	end
	# 	# puts audio_tracks
	# 	# TODO найти взять id трека и заполнить его название
	# 	# TODO взять url по id
	# 	# tracks_urls = []
	# 	# @doc.css(".post_media").each do |body|
	# 	# 	body.css(".audio").each do |item|
	# 	# 		item.css(".play_new").each do |item|
	# 	# 			source_id = item['id'].split('play').pop
	# 	# 			if item['id'].split('_-').last == @post_id
	# 	# 				id = item['id'].split('_-').first 
	# 	# 				puts item.at("input")
	# 	# 				# puts item.at("input#audio_info#{source_id}")['value']
	# 	# 			end
	# 	# 		end
	# 	# 	end
	# 	# end
	# 	# 	# id аудиозаписи
	# 	# 	id = audio2000072245_325277907_-27895931_1106714
	# 	# 	body.css(".wall_audio").each do |row|

	# 	# 		artist = row.at_css("#{audio2000072245_325277907_-27895931_1106714} .fl_l a").text.strip
	# 	# 		title = row.at_css(".fl_l a").text.split('(').shift
	# 	# 		track = artist + title
	# 	# 		agent = Mechanize.new
	# 	# 		form = agent.get(SERVICE_URL).forms.first
	# 	# 		form.q = track
	# 	# 		# страница результатов поискв
	# 	# 		audios = form.submit
	# 	# 		# ссылка для скачивания
	# 	# 		url = audios.at(".playlist-down")['href']
	# 	# 		tracks_urls << [artist, track.gsub('–', '-').gsub('&', 'and').gsub('\'', ''), url]
	# 	# 	end
	# 	# end
	# 	# tracks_urls
	# end

	def post_id
		@post_id
	end

	def title
	end

end

# puts VkPost.new('http://vk.com/exclusive_muzic?w=wall-27895931_1107968').tracks
