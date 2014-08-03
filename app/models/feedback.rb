class Feedback < ActiveRecord::Base
  attr_accessible :description, :sender, :answer, :new_category
  attr_accessor :new_category

  has_one :reply, as: 'replyable', class_name: 'AdminReply'

  scope :published, where(published: true)
  scope :without_answer, joins(:reply).where(admin_replies: { content: nil })
  scope :latest, order("created_at DESC")

  validates_presence_of :description, :message => "^Напишите сообщение для администрации " 
  validates_presence_of :sender, :message => "^Укажите как вас зовут" 
  # validates_presence_of :category, :message => "^Выберите категорию из списка ниже" 
  before_create :add_category

  def add_category
	  if new_category == "thank"
	  		self.category = "thank"
  	elsif new_category == "wish"
	  		self.category = "wish"
  	elsif new_category == "warn"
	  		self.category = "warn"
	  else
	  		self.category = "other"
  	end
  end

end
