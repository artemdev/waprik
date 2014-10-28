# == Schema Information
#
# Table name: categories
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  for_videos       :boolean          default(FALSE)
#  for_serials      :boolean          default(FALSE)
#  for_news         :boolean
#  for_music        :boolean
#  categorable_id   :integer
#  categorable_type :string(255)
#  for_pictures     :boolean
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
