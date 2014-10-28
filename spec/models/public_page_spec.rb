# == Schema Information
#
# Table name: public_pages
#
#  id         :integer          not null, primary key
#  vk_url     :string(255)
#  category   :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe PublicPage do
  pending "add some examples to (or delete) #{__FILE__}"
end
