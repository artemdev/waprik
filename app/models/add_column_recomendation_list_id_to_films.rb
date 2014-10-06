# == Schema Information
#
# Table name: add_column_recomendation_list_id_to_films
#
#  id                    :integer          not null, primary key
#  recomendation_list_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class AddColumnRecomendationListIdToFilms < ActiveRecord::Base
  attr_accessible :recomendation_list_id
end
