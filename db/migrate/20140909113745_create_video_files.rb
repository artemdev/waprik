class CreateVideoFiles < ActiveRecord::Migration
  def change
    create_table :video_files do |t|
      t.integer :video_id
      t.integer :quality_id
      t.integer :format_id
      t.integer :size
      t.string :attach
      t.timestamps
    end
    add_index :video_files, :video_id
    add_index :video_files, :quality_id
    add_index :video_files, :format_id
    add_index :video_files, :size
    add_index :video_files, :attach
  end
end
