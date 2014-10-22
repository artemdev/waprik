class AddColumnImageToVkPosts < ActiveRecord::Migration
  def change
    add_column :vk_posts, :image, :string
    add_index :vk_posts, :image
  end
end
