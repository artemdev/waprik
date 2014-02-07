class RenameTextToDescriptionInNews < ActiveRecord::Migration
  def up
  	rename_column :news, :text, :description
  end

  def down
  end
end
