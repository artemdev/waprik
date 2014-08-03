class Feedback < ActiveRecord::Base
  attr_accessible :description, :sender, :answer, :new_category
  attr_accessor :new_category

  has_one :reply, as: 'replyable', class_name: 'AdminReply'

  scope :published, where(published: true)
  scope :without_answer, joins(:reply).where(admin_replies: { content: nil })
  scope :latest, order("created_at DESC")

  validates_presence_of :description, :message => "^Напишите сообщение для администрации " 
  validates_presence_of :sender, :message => "^Укажите как вас зовут" 
  validates_presence_of :new_category, :message => "^Выберите категорию из списка ниже" 
  before_create :add_category

  def add_category
	  if self.new_category == "thank"
	  		self.category = "thank"
  	elsif category == "wish"
	  		self.new_category = "wish"
  	elsif category == "warn"
	  		self.new_category = "warn"
	  else
	  		self.new_category = "no_permited"
  	end
  end

end
