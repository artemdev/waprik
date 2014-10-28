# == Schema Information
#
# Table name: collection_video_throughs
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  video_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionVideoThrough < ActiveRecord::Base

	belongs_to :collection
	belongs_to :video

end
