class CreateRecomendationLists < ActiveRecord::Migration
  def change
    create_table :recomendation_lists do |t|
      t.timestamps
    end
  end
end
