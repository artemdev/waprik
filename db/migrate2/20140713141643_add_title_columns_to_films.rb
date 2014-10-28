class AddTitleColumnsToFilms < ActiveRecord::Migration
  def change
  	add_column :films, :ru_title, :string
  	add_column :films, :en_title, :string
  	add_index :films, :ru_title
  	add_index :films, :en_title
  end
end
