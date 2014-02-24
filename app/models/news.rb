class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description
  attr_accessor :name

  scope :sorted, order("updated_at ASC")
  scope :sorted, order("created_at DESC") 

  has_and_belongs_to_many :categories, foreign_key: :news_id

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
