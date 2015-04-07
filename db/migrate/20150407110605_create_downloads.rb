class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
    	t.integer :downloadable_id, index: true
    	t.string :downloadable_type, index: true
    	t.string :user_agent
      t.datetime :created_at
    end
  end
end
