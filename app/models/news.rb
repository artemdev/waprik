class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description
  attr_accessor :name

  scope :sorted, order("updated_at ASC")

  def related_news # Похожие по дате создания с обьектом новости
  	related_news = []
  	News.all.each do |object|
  		if object.created_at.to_s(:custom) == self.created_at.to_s(:custom) && object != self
  			related_news << object
  		end
  	end
    return related_news
  end


end
