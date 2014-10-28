class RenameYearsColumnInSerials < ActiveRecord::Migration
  def up
  	 rename_column :serials, :year, :years
  end

  def down
  	 rename_column :serials, :years, :year
  end
end
