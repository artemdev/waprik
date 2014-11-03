class ChangeColumnInSerials < ActiveRecord::Migration
  def up
  	rename_column :serials, :name, :title
  end

  def down
  	rename_column :serials, :name, :title
  end
end
