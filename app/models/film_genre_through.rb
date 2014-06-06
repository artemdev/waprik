class FilmGenreThrough < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = "films_genres_through"

  belongs_to :genre, class_name: "FilmGenre"
  belongs_to :film

end
