class AddColumnBrbUrlToFilms < ActiveRecord::Migration
  def change
    add_column :films, :brb_url, :string
  end
end
