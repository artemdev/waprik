require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'vkontakte_api'
class VkPost
	
	def initialize url=""
		@post_id = "-" + url.split('-').last
		vk = VkontakteApi::Client.new
		@post = vk.wall.getById(posts: @post_id).first
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

	def post_id
		@post_id
	end

	def title
	end

end

puts VkPost.new('https://vk.com/exclusive_muzic?w=wall-27895931_1793253').image
