# == Schema Information
#
# Table name: related_items
#
#  id              :integer          not null, primary key
#  source_item_id  :integer
#  related_item_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe RelatedItems do
  pending "add some examples to (or delete) #{__FILE__}"
end
