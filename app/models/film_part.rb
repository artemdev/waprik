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

  attr_accessible :real_name
end
