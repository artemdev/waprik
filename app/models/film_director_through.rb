class FilmDirectorThrough < ActiveRecord::Base
  self.table_name = "films_directors_through"

  belongs_to :film
  belongs_to :director, class_name: "FilmDirector"

end
