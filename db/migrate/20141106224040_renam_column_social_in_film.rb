class RenamColumnSocialInFilm < ActiveRecord::Migration
  def up
  	rename_column :films, :social, :vk
  end

  def down
  	rename_column :films, :vk, :social
  end
end
