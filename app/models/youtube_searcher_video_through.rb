# == Schema Information
#
# Table name: youtube_searcher_video_throughs
#
#  id          :integer          not null, primary key
#  video_id    :integer
#  searcher_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class YoutubeSearcherVideoThrough < ActiveRecord::Base

  belongs_to :video, class_name: "YoutubeVideo"
  belongs_to :searcher, class_name: "YoutubeSearcher"

end
