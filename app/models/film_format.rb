class FilmFormat < ActiveRecord::Base
  self.table_name = "films_formats"

  attr_accessible :title, :description, :ext
end
