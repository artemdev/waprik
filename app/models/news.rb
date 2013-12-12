class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description
  attr_accessor :name

  scope :sorted, order("updated_at ASC")
  
  # Похожие новости
  def related_news 
  	related_news = []
  	News.all.each do |object|
  		if object.created_at.to_s(:dmy) == self.created_at.to_s(:dmy) && object != self
  			related_news << object
  		end
  	end
    return related_news
  end

end
