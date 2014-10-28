class AddColumnToSerials < ActiveRecord::Migration
  def change
    add_column :serials, :lang, :boolean # rus 0, eng 1
    add_index :serials, :lang
  end
end
