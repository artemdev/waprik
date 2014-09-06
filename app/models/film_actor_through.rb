# == Schema Information
#
# Table name: films_actors_through
#
#  film_id    :integer
#  actor_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class FilmActorThrough < ActiveRecord::Base
  self.table_name = "films_actors_through"
  # attr_accessible :title, :body

  belongs_to :actor, class_name: "FilmActor"
  belongs_to :film

end
