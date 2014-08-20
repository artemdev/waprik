class CreateCollectionVideoThroughs < ActiveRecord::Migration
  def change
    create_table :collection_video_throughs do |t|
      t.integer :collection_id
      t.integer :video_id
      t.timestamps
    end
    add_index :collection_video_throughs, :collection_id
    add_index :collection_video_throughs, :video_id
  end
end
