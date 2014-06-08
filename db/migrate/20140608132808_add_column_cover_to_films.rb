class AddColumnCoverToFilms < ActiveRecord::Migration
  def change
    add_column :films, :cover, :string
  end
end
