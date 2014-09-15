class AddColumnToSerialSeriesFiles < ActiveRecord::Migration
  def change
    add_column :serial_serie_files, :downloads, :integer, default: 0
    add_index :serial_serie_files, :downloads
  end
end
