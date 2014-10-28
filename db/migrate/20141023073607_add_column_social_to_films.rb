class AddColumnSocialToFilms < ActiveRecord::Migration
  def change
    add_column :films, :social, :boolean
  end
end
