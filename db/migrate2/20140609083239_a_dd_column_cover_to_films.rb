class ADdColumnCoverToFilms < ActiveRecord::Migration
  def up
  	add_column :films, :cover, :string
  	add_index :films, :cover
  end

  def down
  end
end
