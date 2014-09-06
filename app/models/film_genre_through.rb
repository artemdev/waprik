# == Schema Information
#
# Table name: films_genres_through
#
#  film_id    :integer
#  genre_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class FilmGenreThrough < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = "films_genres_through"

  belongs_to :genre, class_name: "FilmGenre"
  belongs_to :film

end
