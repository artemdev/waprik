class AddColumnsToNews < ActiveRecord::Migration
  def change
  	add_column :news, :published_at, :datetime
  	add_column :news, :title, :string, default: ""
   	add_column :news, :user_id, :integer
  end
end
