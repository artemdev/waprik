class CreateSerialSerieFiles < ActiveRecord::Migration
  def change
    create_table :serial_serie_files do |t|
      t.integer :serie_id
      t.integer :quality_id #e.x DVDRip
      t.integer :format_id #e.x mp4 320 (среднее качество)
      t.string :attach
      t.integer :size, default: 0
      t.timestamps
    end
    add_index :serial_serie_files, :size
    add_index :serial_serie_files, :serie_id
    add_index :serial_serie_files, :quality_id
    add_index :serial_serie_files, :format_id
    add_index :serial_serie_files, :attach
  end
end
