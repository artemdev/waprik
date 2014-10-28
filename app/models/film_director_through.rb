# == Schema Information
#
# Table name: films_directors_through
#
#  film_id     :integer
#  director_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class FilmDirectorThrough < ActiveRecord::Base
  self.table_name = "films_directors_through"

  belongs_to :film
  belongs_to :director, class_name: "FilmDirector"

end
