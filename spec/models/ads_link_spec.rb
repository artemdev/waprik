# == Schema Information
#
# Table name: ads_links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  to         :string(255)
#  from       :string(255)
#  expires_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe AdsLink do
  pending "add some examples to (or delete) #{__FILE__}"
end
