class CreateAdminReplies < ActiveRecord::Migration
  def change
    create_table :admin_replies do |t|
    	t.references :replyable, polymorphic: true
    	t.text :content, limit: 500
    	t.integer :admin_id
      t.timestamps
    end

    add_index :admin_replies, :replyable_id
    add_index :admin_replies, :replyable_type
    add_index :admin_replies, :admin_id
		add_index(:admin_replies, :content, :length => 500)
  end
end
