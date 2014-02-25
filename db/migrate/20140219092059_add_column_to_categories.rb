class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :with_videos, :boolean, default: 0
    add_column :categories, :with_serials, :boolean, default: 0
  end
end
