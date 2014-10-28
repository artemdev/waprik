class AddColumnImageToPublicPosts < ActiveRecord::Migration
  def change
    add_column :public_posts, :image, :string
    add_index :public_posts, :image
  end
end
