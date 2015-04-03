class AddColumnSourceUrlToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :source_url, :string
    add_index :collections, :source_url
  end
end
