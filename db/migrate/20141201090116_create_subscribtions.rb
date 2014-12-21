class CreateSubscribtions < ActiveRecord::Migration
  def change
    create_table :subscribtions do |t|
      t.integer :user_id, index: true
      t.references :subscribable, polymorphic: true, index:true
      t.timestamps
    end
  end
end
