# == Schema Information
#
# Table name: films_actors
#
#  id         :integer          not null, primary key
#  name       :string(100)
#  created_at :datetime
#  updated_at :datetime
#

# string "name", :limit => 100
class FilmActor < ActiveRecord::Base
  self.table_name = "films_actors"
  attr_accessible :name

  has_many :films_actors_through, class_name: "FilmActorThrough", foreign_key: 'actor_id'
  has_many :films, through: :films_actors_through

end
