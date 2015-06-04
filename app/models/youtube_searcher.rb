# == Schema Information
#
# Table name: youtube_searchers
#
#  id         :integer          not null, primary key
#  keywords   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class YoutubeSearcher < ActiveRecord::Base
  attr_accessible :keywords

  has_many :youtube_searcher_video_throughs, foreign_key: 'searcher_id'
  has_many :videos, through: :youtube_searcher_video_throughs


end
