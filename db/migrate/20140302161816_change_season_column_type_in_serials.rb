class ChangeSeasonColumnTypeInSerials < ActiveRecord::Migration
  def up
  	change_column :serials, :season, :integer
  end

  def down
  	change_column :serials, :season, :string
  end
end
