class AddColumnYoutubeLinkToFilmCollections < ActiveRecord::Migration
  def change
    add_column :films, :youtube_link, :string
    add_index :films, :youtube_link
  end
end
