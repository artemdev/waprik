class FilmQuality < ActiveRecord::Base
  self.table_name = "films_qualities"

  attr_accessible :title
end
