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

class Wish < ActiveRecord::Base

  belongs_to :wishable
  
end
