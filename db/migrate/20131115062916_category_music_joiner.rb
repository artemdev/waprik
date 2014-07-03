class CategoryMusicJoiner < ActiveRecord::Migration
  def up
  	create_table :categories_music, :id => false do |t|
  		t.integer "music_id"
  		t.integer "category_id"
  	end
  	add_index :categories_music, ["music_id", "category_id"]
  end

  def down
  	drop_table :categories_music
  end
end
