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

class Subscribtion < ActiveRecord::Base
  attr_accessible :subscribable, :user_id

  belongs_to :user
  belongs_to :subscribable,  polymorphic: true

end
