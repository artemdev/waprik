class FilmActorThrough < ActiveRecord::Base
  self.table_name = "films_actors_through"
  # attr_accessible :title, :body

  belongs_to :actor, class_name: "FilmActor"
  belongs_to :film

end
