class AddColumnToMp3Files < ActiveRecord::Migration
  def change
    add_column :mp3_files, :new_path, :string
    add_index :mp3_files, :new_path
  end
end
