class CreateSerials < ActiveRecord::Migration
  def change
    create_table :serials do |t|
    	t.string :description
    	t.string :season
    	t.boolean :updating
    	t.string :name
    	t.string :cover
    	t.boolean :hit
    	t.string :year
      t.timestamps
    end
  end
end
