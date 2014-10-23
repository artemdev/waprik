# == Schema Information
#
# Table name: public_posts
#
#  id         :integer          not null, primary key
#  vk_id      :string(255)
#  visible    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

require 'spec_helper'

describe PublicPost do
  pending "add some examples to (or delete) #{__FILE__}"
end
