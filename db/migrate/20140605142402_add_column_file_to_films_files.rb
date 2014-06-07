class AddColumnFileToFilmsFiles < ActiveRecord::Migration
  def change
    add_column :films_files, :file, :string
    add_index :films_files, :file
  end
end
