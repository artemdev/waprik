# == Schema Information
#
# Table name: collection_film_throughs
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  film_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionFilmThrough < ActiveRecord::Base

	belongs_to :collection, foreign_key: 'collection_id'
	belongs_to :film
	
end
