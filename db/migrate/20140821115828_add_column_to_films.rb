class AddColumnToFilms < ActiveRecord::Migration
  def change
    add_column :films, :broken, :boolean
  end
end
