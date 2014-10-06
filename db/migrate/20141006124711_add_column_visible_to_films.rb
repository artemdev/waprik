class AddColumnVisibleToFilms< ActiveRecord::Migration
  def change
    	rename_column :films, :without_files, :visible
  end
end
