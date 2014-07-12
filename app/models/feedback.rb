class Feedback < ActiveRecord::Base
  attr_accessible :description, :sender, :answer, :type, :category

  has_one :reply, as: 'replyable', class_name: 'AdminReply'

  scope :published, where(published: true).order("updated_at ASC")
  scope :without_answer, order("created_at DESC")

end
