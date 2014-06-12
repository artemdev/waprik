class AddColumnsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :with_news, :boolean
    add_column :categories, :with_music, :boolean
  end
end
