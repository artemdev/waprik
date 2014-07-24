# string  "title",    :limit => 50
# integer "position"
class FilmQuality < ActiveRecord::Base
  self.table_name = "films_qualities"

  attr_accessible :title

  has_many :films, foreign_key: 'quality_id'
  has_many :film_files
  
end
