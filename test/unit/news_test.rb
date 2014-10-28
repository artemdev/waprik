# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  description  :string(1000)
#  section      :string(255)
#  visible      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string(255)
#  published_at :datetime
#  user_id      :integer
#

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
