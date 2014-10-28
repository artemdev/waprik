# == Schema Information
#
# Table name: films_formats
#
#  id          :integer          not null, primary key
#  title       :string(100)      not null
#  description :string(100)      not null
#  ffparams    :string(1000)     not null
#  ext         :string(10)       not null
#  created_at  :datetime
#  updated_at  :datetime
#
class FilmFormat < ActiveRecord::Base
  self.table_name = "films_formats"

  attr_accessible :title, :description, :ext, :ffparams
  has_many :film_files

  validates :title, presence: true

end
