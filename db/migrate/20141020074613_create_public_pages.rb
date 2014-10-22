class CreatePublicPages < ActiveRecord::Migration
  def change
    create_table :public_pages do |t|
      t.string :vk_url
      t.string :category
      t.string :title

      t.timestamps
    end
    add_index :public_pages, :vk_url
    add_index :public_pages, :category
    add_index :public_pages, :title
  end
end
