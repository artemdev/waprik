class ChangeColumnDownloadsInPictures < ActiveRecord::Migration
  def up
  	change_column :pictures, :downloads, :integer, default: 0
  end

  def down
  	change_column :pictures, :downloads, :integer, default: nil
  end
end
