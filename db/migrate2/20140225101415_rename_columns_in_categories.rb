class RenameColumnsInCategories < ActiveRecord::Migration
  def up
  	rename_column :categories, :with_music, :for_music
  	rename_column :categories, :with_serials, :for_serials
  	rename_column :categories, :with_news, :for_news
  	rename_column :categories, :with_videos, :for_videos
  end
  
  def down
  	rename_column :categories, :for_music, :with_music
  	rename_column :categories, :for_serials, :with_serials
  	rename_column :categories, :for_news, :with_news
  	rename_column :categories, :for_videos, :with_videos
  end
end
