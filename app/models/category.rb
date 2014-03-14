class Category < ActiveRecord::Base
 	attr_accessible :name, :video_id, :for_serials, :for_news, :for_videos, :for_music

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "categories_music"
  has_and_belongs_to_many :serials
  has_and_belongs_to_many :news

  belongs_to :categorable, polymorphic: true

 	scope :sorted, order("created_at ASC")
  scope :for_serials, where(for_serials: true)
  scope :for_news, where(for_news: true)
  scope :for_music, where(for_music: true)
  scope :for_videos, where(for_videos: true)
  scope :for_pictures, where(for_pictures: true)

  validates_presence_of :name, message: "нужно заполнить название категории"
  
  before_destroy { videos.clear }

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
