# == Schema Information
#
# Table name: subscribtions
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  subscribable_id   :integer
#  subscribable_type :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Subscribtion do
  pending "add some examples to (or delete) #{__FILE__}"
end
