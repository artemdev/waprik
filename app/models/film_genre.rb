# == Schema Information
#
# Table name: films_genres
#
#  id         :integer          not null, primary key
#  title      :string(100)
#  created_at :datetime
#  updated_at :datetime
#

# string "title", :limit => 100
class FilmGenre < ActiveRecord::Base
  self.table_name = "films_genres"
  attr_accessible :title

  # films
  has_many :films_genres_through, class_name: "FilmGenreThrough", foreign_key: 'genre_id'
  has_many :films, through: :films_genres_through

end
