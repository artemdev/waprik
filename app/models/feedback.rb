class Feedback < ActiveRecord::Base
  attr_accessible :description, :sender, :answer, :category

  has_one :reply, as: 'replyable', class_name: 'AdminReply'

  scope :published, where(published: true).order("updated_at ASC")
  scope :without_answer, order("created_at DESC")

  def add_category_from category
	  if category == "thank"
	  		self.category = "thank"
	  		return true
  	elsif category == "wish"
	  		self.category = "wish"
	  		return true
  	elsif category == "warn"
	  		self.category = "warn"
	  		return true
	  else
	  	return false
  	end
  end

end
