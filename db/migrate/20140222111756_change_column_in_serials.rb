class ChangeColumnInSerials < ActiveRecord::Migration
  def up
  	change_column :serials, :updating, :boolean, default: 1
  end

  def down
  end
end
