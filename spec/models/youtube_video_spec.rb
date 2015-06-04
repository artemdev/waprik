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

require 'spec_helper'

describe YoutubeVideo do
  pending "add some examples to (or delete) #{__FILE__}"
end
