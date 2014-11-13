class AddColumnTorrentToSerials < ActiveRecord::Migration
  def change
    add_column :serials, :torrent, :string
  end
end
