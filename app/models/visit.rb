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

class Visit < ActiveRecord::Base
	
  belongs_to :fromable, polymorphic: true # от кого посещение (инициатор)
  belongs_to :visitable, polymorphic: true # кому посещение (цель)

end
