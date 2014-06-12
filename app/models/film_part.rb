# integer "num"
# integer "file_id"
# integer "film_id"
# integer "format_id"
# string  "real_name"
# integer "duration"
# integer "size"
# integer "downloads"
class FilmPart < ActiveRecord::Base
  self.table_name = "films_parts"

	mount_uploader :real_name, FilmPartUploader

  belongs_to :film_file, foreign_key: 'file_id'
	belongs_to :film
	
end
