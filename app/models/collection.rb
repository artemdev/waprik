class Collection < ActiveRecord::Base
  attr_accessible :name, :video_id, :hit

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :music, :join_table => "collections_music"

  scope :top, where(:hit => 1).order("updated_at ASC")  # Находим хитовые видео
  scope :sorted, order("created_at ASC") # Стандартная сортировка

  # Есть ли музыка в коллекции ?
  def music_empty? 
  	if self.music == []
  		return true
  	else
  		return false
  	end
  end

  # Есть ли видео в коллекции ?
  def videos_empty? 
    if self.videos == []
      return true
    else
      return false
    end
  end

  # Есть ли хиты в коллекции ?
  def hit? 
  	if self.hit == true
  		return true
  	else
  		return false
  	end
  end

end
