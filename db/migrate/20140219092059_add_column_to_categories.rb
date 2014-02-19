class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :with_videos, :boolean
    add_column :categories, :with_serials, :boolean
  end
end
