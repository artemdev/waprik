class AddColumnTorrentToFilm < ActiveRecord::Migration
  def change
    add_column :films, :torrent, :string
    add_index :films, :torrent
  end
end
