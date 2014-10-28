class AddPermalinkToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :permalink, :string
    add_index :collections, :permalink
  end
end
