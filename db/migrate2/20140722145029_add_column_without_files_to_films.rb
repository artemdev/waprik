class AddColumnWithoutFilesToFilms < ActiveRecord::Migration
  def change
    add_column :films, :without_files, :boolean
    add_index :films, :without_files
  end
end
