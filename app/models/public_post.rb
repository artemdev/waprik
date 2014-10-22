# == Schema Information
#
# Table name: public_posts
#
#  id         :integer          not null, primary key
#  vk_id      :string(255)
#  visible    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PublicPost < ActiveRecord::Base
  attr_accessible :visible, :vk_id
end
