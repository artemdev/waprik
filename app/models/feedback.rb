class Feedback < ActiveRecord::Base
  attr_accessible :description, :sender, :answer, :type

  scope :published, where(published: true).order("updated_at ASC")

end
