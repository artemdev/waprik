class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
    	t.integer :serial_id
    	t.string :name
    	t.string :relise_date
      t.timestamps
    end
    add_index :series, :serial_id
  end
end
