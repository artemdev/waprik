class Category < ActiveRecord::Base
 	attr_accessible :name, :video_id

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "categories_music"
  has_and_belongs_to_many :serials

 	scope :sorted, order("created_at ASC")
  scope :with_serials, where(with_serials: true)
  
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
