# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  description  :string(1000)
#  section      :string(255)
#  visible      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string(255)
#  published_at :datetime
#  user_id      :integer
#

class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description, :category
  attr_accessor :name, :category

  before_create :add_category

  has_many :tracks, class_name: 'Mp3File'

  scope :sorted, order("updated_at ASC")
  scope :latest, order("created_at DESC") 

  has_and_belongs_to_many :categories
  
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
