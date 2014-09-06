class CreateAddColumnToSeries < ActiveRecord::Migration
  def change
    create_table :serial_seasons do |t|
      t.integer :serial_id, index: true
      t.integer :number, index: true
      t.integer :serial_serie_id, index: true
      t.timestamps
    end
  end
end
