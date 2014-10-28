class AddPermalinkColumnsTocontent < ActiveRecord::Migration
  def up
  	# columns
  	add_column :films, :permalink, :string
  	add_column :mp3_files, :permalink, :string
  	add_column :mp3_artists, :permalink, :string
  	# indexes
  	add_index :films, :permalink
  	add_index :mp3_files, :permalink
  	add_index :mp3_artists, :permalink
  end

  def down
  	remove_column :mp3_artists, :permalink
  	remove_column :mp3_files, :permalink
  	remove_column :films, :permalink
  end
end
