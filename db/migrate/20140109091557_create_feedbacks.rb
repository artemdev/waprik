class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.string "description"
    	t.string "answer"
    	t.string "type"
    	t.string "sender"
    	t.boolean "published"
      t.timestamps
    end
    add_index :feedbacks, 'type'
  end
end
