class Category < ActiveRecord::Base
 	attr_accessible :name, :video_id, :with_serials, :with_news, :with_videos, :with_music

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "categories_music"
  has_and_belongs_to_many :serials
  has_and_belongs_to_many :news

 	scope :sorted, order("created_at ASC")
  scope :for_serials, where(for_serials: true)
  scope :for_news, where(for_news: true)
  scope :for_music, where(for_music: true)
  scope :for_videos, where(for_videos: true)

  validates_presence_of :name, message: "нужно заполнить название категории"

 	# Удаление видео из категории
 	def destroy_videos
 		self.videos.each {|video| video.destroy}
 		return true
 	end

	# Есть ли музыка в категории ?
  def with_music?
  	if self.music.empty?
  		return false
  	else
  		return true
  	end
  end

  # Есть ли новости в категории ?
  def with_news?
    if self.news.empty?
      return false
    else
      return true
    end
  end

  # Есть ли сериалы в категории ?
  def with_serials?
    if self.serials.empty?
      return false
    else
      return true
    end
  end

  # Есть ли видео в категории ?
  def with_videos?
    if self.videos.empty?
      return false
    else
      return true
    end
  end  
end
