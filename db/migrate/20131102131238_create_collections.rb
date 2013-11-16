class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
    	t.string "name"
    	t.boolean "hit", :default => 0
      t.timestamps
    end
  end
end
