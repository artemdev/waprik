class CollectionMusicThrough < ActiveRecord::Base

	belongs_to :collection
	belongs_to :track, class_name: 'Mp3File'

end
