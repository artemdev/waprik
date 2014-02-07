class IncreaseDescriptionLimitInNews < ActiveRecord::Migration
  def up
  	change_column :news, :description, :string, :limit => 1000
  end

  def down
  end
end
