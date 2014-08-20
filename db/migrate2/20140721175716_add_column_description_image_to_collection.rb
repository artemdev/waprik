class AddColumnDescriptionImageToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :description, :string
    add_column :collections, :image, :string
    add_index :collections, :description
    add_index :collections, :image
  end
end
