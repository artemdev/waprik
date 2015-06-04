class CreateYoutubeSearcherVideoThroughs < ActiveRecord::Migration
  def change
    create_table :youtube_searcher_video_throughs do |t|
      t.integer :video_id, index: true
      t.integer :searcher_id, index: true
      t.timestamps
    end
  end
end
