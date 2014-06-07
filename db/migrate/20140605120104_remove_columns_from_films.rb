class RemoveColumnsFromFilms < ActiveRecord::Migration
  def up
  	add_column :films, :count_comments, :integer, default: 0
  	add_column :films, :count_likes, :integer, default: 0
   	change_column :films, :downloads, :integer, default: 0
  end

  def down
  end
end
