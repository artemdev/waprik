# == Schema Information
#
# Table name: films_collections
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  youtube_link :string(255)
#  cover        :string(255)
#  description  :string(255)
#

class FilmCollection < ActiveRecord::Base
	self.table_name = "films_collections"

  attr_accessible :name, :cover

  mount_uploader :cover, CoverUploader

  scope :latest, order("created_at DESC")

  has_many :collection_film_throughs, foreign_key: 'collection_id'
  has_many :films, through: :collection_film_throughs

  def author
  	nil
  end

end
