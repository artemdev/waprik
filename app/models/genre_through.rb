# == Schema Information
#
# Table name: films_genres_through
#
#  genreable_id   :integer          not null
#  genre_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  genreable_type :string(255)
#  id             :integer
#

class GenreThrough < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = "films_genres_through"

  belongs_to :genre, class_name: "FilmGenre", foreign_key: "genre_id"
  belongs_to :genreable, polymorphic: true

end
