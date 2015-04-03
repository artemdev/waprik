# == Schema Information
#
# Table name: public_pages
#
#  id         :integer          not null, primary key
#  vk_url     :string(255)
#  category   :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'vk_public_parser'
class PublicPage < ActiveRecord::Base
  attr_accessible :category, :title, :vk_url

  # типы пабликов
  ERO = "ero"
  FILMS = "films"

  scope :ero, where(category: ERO)
  scope :films, where(category: FILMS)

  # возвращает количество постов из вк
  def self.parse_ero
		PublicPage.ero.each do |page|
			count = page.parse!
		end
		count
	end

	# парсинг новых постов вк
	def parse!
		count = 0
		VkPublicParser.new(self.vk_url).posts.each do |vk_post|
			# не парсим посты, которые уже есть
		  unless PublicPost.find_by_vk_id(vk_post.pid)
		  	PublicPost.create(vk_id: vk_post.pid, image: attachments.first.photo.src)
		  	count += 1
			end
		end
		count
	end

end
