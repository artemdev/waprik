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

class RelatedItems < ActiveRecord::Base
  attr_accessible :first_item_id, :second_item_id
end
