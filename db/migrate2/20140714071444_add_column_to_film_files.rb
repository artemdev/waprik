class AddColumnToFilmFiles < ActiveRecord::Migration
  def change
    add_column :films_files, :quality_id, :integer
    add_index :films_files, :quality_id
  end
end
