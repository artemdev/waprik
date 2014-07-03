class CategoriesNewsJoinTable < ActiveRecord::Migration
  def up
  	create_table :categories_news, id: false do |t|
  		t.integer :category_id
  		t.integer :news_id
  	end
  	add_index :categories_news, ['news_id', 'category_id']
  end

  def down
  	drop_table :categories_news
  end
end
