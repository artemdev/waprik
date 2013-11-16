class News < ActiveRecord::Base
  attr_accessible :section, :visible, :description
  attr_accessor :name

  scope :sorted, order("updated_at ASC")

end
