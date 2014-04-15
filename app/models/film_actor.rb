class FilmActor < ActiveRecord::Base
  self.table_name = "films_actors"
  attr_accessible :name
end
