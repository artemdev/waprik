class CollectionFilmThrough < ActiveRecord::Base

	belongs_to :collection
	belongs_to :film
	
end
