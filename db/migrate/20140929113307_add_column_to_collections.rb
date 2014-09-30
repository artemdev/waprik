class AddColumnToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :vk_title, :string
  end
end
