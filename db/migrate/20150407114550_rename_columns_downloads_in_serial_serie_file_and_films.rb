class RenameColumnsDownloadsInSerialSerieFileAndFilms < ActiveRecord::Migration
  def up
  	rename_column :films, :downloads, :download
  	rename_column :serial_serie_files, :downloads, :download  	
  end

  def down
  end
end
