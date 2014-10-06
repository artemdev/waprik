class CreateAddColumnRecomendationListIdToFilms < ActiveRecord::Migration
  def change
   		add_column :films, :recomendation_list_id, :integer, index: true
  end
end
