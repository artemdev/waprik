class AddColumnsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :blocked, :boolean
    add_index :films, :blocked
  end
end
