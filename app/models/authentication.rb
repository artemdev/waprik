# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  uid        :string(255)
#  provider   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid
end
