class CreateCollectionMusicThroughs < ActiveRecord::Migration
  def change
    create_table :collection_music_throughs do |t|
      t.integer :collection_id
      t.integer :track_id
      t.timestamps
    end
    add_index :collection_music_throughs, :collection_id
    add_index :collection_music_throughs, :track_id
  end
end
