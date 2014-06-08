class AddColumnToFilms < ActiveRecord::Migration
  def change
    add_column :films, :cover, :string
    add_index :films, :cover
  end
end
