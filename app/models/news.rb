class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description, :title, :category
  attr_accessor :name, :category

  before_create :add_category

  scope :sorted, order("updated_at ASC")
  scope :latest, order("created_at DESC") 

  has_and_belongs_to_many :categories, foreign_key: :news_id
  
  validates_presence_of :title, message: "^ Нужно указать заглавие к новости"
  validates_presence_of :description, message: "^Новость не может быть пустой"

  # Похожие новости
  def related_news 
  	related_news = []
  	News.all.each do |object|
  		if object.created_at.to_s(:dmy) == self.created_at.to_s(:dmy) && object != self && !object.categories.empty?
  			related_news << object
  		end
  	end
    return related_news
  end

  def add_category
    cat = Category.find_by_name(category)
    self.categories <<  cat
  end

end
