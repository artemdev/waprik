class AddColumnToFilmFiles < ActiveRecord::Migration
  def change
    add_column :films_files, :file, :string
  end
end
