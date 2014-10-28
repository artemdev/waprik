class AddColumnVkUrlToMp3Files < ActiveRecord::Migration
  def change
    add_column :mp3_files, :vk_url, :string
  end
end
