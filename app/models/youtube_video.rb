# == Schema Information
#
# Table name: youtube_videos
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  views       :integer
#  cover       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  source_url  :string(255)
#  time        :string(255)
#

class YoutubeVideo < ActiveRecord::Base
  attr_accessible :description, :image, :name, :views

  validates :name, :cover, :source_url, presence: true

  has_many :youtube_searcher_video_throughs, foreign_key: 'video_id'
  has_many :searches, through: :youtube_searcher_video_throughs, source: 'video'


  mount_uploader :cover, CoverUploader

  def self.find_or_create_from youtube_video=nil
  	video = YoutubeVideo.find_or_initialize_by_source_url(youtube_video.url)
  	nil unless video
  	if video.new_record? || video.updated_at <= (Time.now - 1.day)
	  	video.description = youtube_video.description
	  	video.name = youtube_video.name
	  	video.remote_cover_url = youtube_video.image
      video.views = youtube_video.views
      video.time = youtube_video.time
	  	video.save
	  end
	  	video
  end

  def format_3gp
    `youtube-dl -g -f 36 #{source_url}`
  end
  def format_mp4 
    `youtube-dl -g -f 133 #{source_url}`
  end
end
