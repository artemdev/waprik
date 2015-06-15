require 'vkontakte_api'
class VkPublicParser
	attr_reader :posts

	COUNT = 10

	def initialize vk_url
		@vk = VkontakteApi::Client.new
		@screen_name = vk_url.split('/').last
	end
  
	def posts
		@posts = @vk.wall.get(domain: @screen_name, count: COUNT)
		@posts = @posts.drop(1)
	end

	# vk_url, title
	def info
		Struct.new("Info", :title, :url)
		Struct::Info.new(@vk.groups.getById(group_ids: @screen_name).first.name, "http://vk.com/#{@screen_name}" )
	end

end

# puts VkPublicPageParser.new("exclusive_muzic").posts.first.attachments.first.photo.post_id