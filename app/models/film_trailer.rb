# integer "film_id"
# string  "filename", :limit => 50
# integer "filesize"
class FilmTrailer < ActiveRecord::Base
  self.table_name = "films_trailers"

  mount_uploader :filename, FilmTrailerUploader

  belongs_to :film

end
