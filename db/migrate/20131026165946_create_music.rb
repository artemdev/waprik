class CreateMusic < ActiveRecord::Migration
  def up
  	create_table :music do |t|
  		t.boolean "hit"
  		t.integer "downloads"
  		t.string "name"
  		t.string "link_orig"
  		t.string "link_128"
  		t.string "link_64"
  		t.timestamps
  	end
  end

  def down
  	drop_table :music
  end
end
