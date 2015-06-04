class CreateYoutubeSearchers < ActiveRecord::Migration
  def change
    create_table :youtube_searchers do |t|
      t.string :keywords
      t.timestamps
    end
    add_index :youtube_searchers, :keywords
  end
end
