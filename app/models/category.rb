class Category < ActiveRecord::Base
 	attr_accessible :name, :video_id

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "categories_music"

 	scope :sorted, order("created_at ASC")

 	def destroy_videos
 		self.videos.each {|video| video.destroy}
 		return true
 	end

  def with_music? # проверка на наличие музыки в категории
  	if self.music.empty?
  		return false
  	else
  		return true
  	end
  end
end
