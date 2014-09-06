# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  description  :string(255)
#  screen       :string(255)
#  low_3gp      :string(255)
#  mp4_320      :string(255)
#  size         :integer
#  name         :string(255)
#  artist       :string(255)
#  downloads    :integer          default(0)
#  source_video :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mp4_640      :string(255)
#  published_at :datetime
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
