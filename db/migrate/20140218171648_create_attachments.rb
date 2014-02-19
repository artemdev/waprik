class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    	t.integer :serial_id
    	t.string :mp4_640
    	t.integer :count_mp4_640
    	t.string :mp4_320
    	t.integer :count_mp4_320
     	t.string :low_3gp
    	t.integer :count_low_3gp
      t.timestamps
    end
    add_index :attachments, :serial_id
  end
end
