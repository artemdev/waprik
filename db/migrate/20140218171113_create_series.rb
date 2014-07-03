class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
    	t.integer :serial_id
    	t.string :name
    	t.string :release_date
    	t.integer :number
      t.string :mp4_640
      t.integer :dl_mp4_640, default: 0
      t.string :mp4_320
      t.integer :dl_mp4_320, default: 0
      t.string :low_3gp
      t.integer :dl_low_3gp, default: 0
      t.timestamps
    end
    add_index :series, :serial_id
  end
end
