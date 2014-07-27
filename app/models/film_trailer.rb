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
