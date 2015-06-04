# == Schema Information
#
# Table name: films_formats
#
#  id          :integer          not null, primary key
#  title       :string(100)
#  description :string(100)
#  ffparams    :string(1000)
#  ext         :string(10)
#  created_at  :datetime
#  updated_at  :datetime
#

class FilmFormat < ActiveRecord::Base
  self.table_name = "films_formats"

  default_scope order("created_at DESC")

  before_create :set_nulls

  attr_accessible :title, :description, :ext, :ffparams
  has_many :film_files

  validates :title, presence: true

  def set_nulls
  	self.description = ""
  	self.ext = ""
  	self.ffparams = ""
  end

end
