# string "name", :limit => 100
class FilmDirector < ActiveRecord::Base
  self.table_name = "films_directors"

  attr_accessible :name
  has_many :film_director_through, foreign_key: 'director_id'
  has_many :films, through: :film_director_through

end
