class AddColumnsToMp3Files < ActiveRecord::Migration
  def change
  	add_column :mp3_files, :news_id, :integer
  end
end
