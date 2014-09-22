# == Schema Information
#
# Table name: collection_music_throughs
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  track_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionMusicThrough < ActiveRecord::Base

	belongs_to :collection, touch: true
	belongs_to :track, class_name: 'Mp3File', touch: true

end
