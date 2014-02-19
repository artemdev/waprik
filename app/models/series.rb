class Series < ActiveRecord::Base
  attr_accessible :name, :relise_date

  belongs_to :serial
  has_many :attachments

end
