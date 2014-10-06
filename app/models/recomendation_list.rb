# == Schema Information
#
# Table name: recomendation_lists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RecomendationList < ActiveRecord::Base
 	has_many :films
end
