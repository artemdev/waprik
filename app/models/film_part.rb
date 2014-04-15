class FilmPart < ActiveRecord::Base
  self.table_name = "films_parts"

  attr_accessible :real_name
end
