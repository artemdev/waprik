# == Schema Information
#
# Table name: music
#
#  id         :integer          not null, primary key
#  hit        :boolean
#  downloads  :integer
#  name       :string(255)
#  link_orig  :string(255)
#  link_128   :string(255)
#  link_64    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
