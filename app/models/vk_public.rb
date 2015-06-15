# == Schema Information
#
# Table name: vk_publics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VkPublic < ActiveRecord::Base
  attr_accessible :name, :permalink
end
