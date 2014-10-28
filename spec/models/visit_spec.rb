# == Schema Information
#
# Table name: visits
#
#  id             :integer          not null, primary key
#  visitable_id   :integer
#  visitable_type :string(255)
#  fromable_id    :integer
#  fromable_type  :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Visit do
  pending "add some examples to (or delete) #{__FILE__}"
end
