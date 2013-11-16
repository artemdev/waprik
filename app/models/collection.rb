class Collection < ActiveRecord::Base
  attr_accessible :name, :video_id, :hit

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "collections_music"

  scope :top, where(:hit => 1).order("updated_at ASC")
  scope :sorted, order("created_at ASC")

  def music_empty? # Есть ли музыка в коллекции ?
  	if self.music == []
  		return true
  	else
  		return false
  	end
  end

  def hit? # Есть ли хиты в коллекции ?
  	if self.hit == true
  		return true
  	else
  		return false
  	end
  end

  def videos_empty? # Есть ли видео в коллекции ?
  	if self.videos == []
  		return true
  	else
  		return false
  	end
  end
end
