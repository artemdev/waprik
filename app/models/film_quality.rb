# string  "title",    :limit => 50
# integer "position"
class FilmQuality < ActiveRecord::Base
  self.table_name = "films_qualities"

  attr_accessible :title

  has_many :films
end
