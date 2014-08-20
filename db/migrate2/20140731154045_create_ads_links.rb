class CreateAdsLinks < ActiveRecord::Migration
  def change
    create_table :ads_links do |t|
      t.string :title
      t.string :to
      t.string :from
      t.datetime :expires_at
      t.timestamps
    end

    add_index :ads_links, :title
    add_index :ads_links, :from
    add_index :ads_links, :expires_at
  end
end
