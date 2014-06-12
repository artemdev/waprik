class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string :image
    	t.integer :downloads
    	t.string :description
    	t.integer :author_id
      t.timestamps	
    end
    add_index :pictures, ['author_id']
  end
end
