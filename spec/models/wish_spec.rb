# == Schema Information
#
# Table name: wishes
#
#  id            :integer          not null, primary key
#  wishable_id   :integer
#  wishable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Wish do
  pending "add some examples to (or delete) #{__FILE__}"
end
