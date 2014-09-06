# == Schema Information
#
# Table name: films_trailers
#
#  id         :integer          not null, primary key
#  film_id    :integer          not null
#  filename   :string(50)       not null
#  filesize   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# integer "film_id"
# string  "filename", :limit => 50
# integer "filesize"
class FilmTrailer < ActiveRecord::Base
	attr_accessible :filename

  self.table_name = "films_trailers"
  attr_accessible :filename

  mount_uploader :filename, FilmTrailerUploader

  belongs_to :film

  # validates :film_id, presence: true

end
