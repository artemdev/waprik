class CreatePublicPosts < ActiveRecord::Migration
  def change
    create_table :public_posts do |t|
      t.string :vk_id
      t.boolean :visible

      t.timestamps
    end
    add_index :public_posts, :vk_id
    add_index :public_posts, :visible
  end
end
