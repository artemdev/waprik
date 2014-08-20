class AddColumnForPicturesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :for_pictures, :boolean
  end
end
