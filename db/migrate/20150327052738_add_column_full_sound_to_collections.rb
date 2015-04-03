class AddColumnFullSoundToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :full_sound, :string
    add_index :collections, :full_sound
  end
end
