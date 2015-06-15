class CreateVkPosts < ActiveRecord::Migration
  def change
    create_table :vk_posts do |t|
      t.string :vk_description
      t.string :vk_id

      t.timestamps
    end
    add_index :vk_posts, :vk_description
    add_index :vk_posts, :vk_id
  end
end
