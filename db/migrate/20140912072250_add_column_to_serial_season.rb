class AddColumnToSerialSeason < ActiveRecord::Migration
  def change
    add_column :serial_seasons, :title, :string
    add_index :serial_seasons, :title
  end
end
