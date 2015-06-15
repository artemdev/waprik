class CreateVkPublics < ActiveRecord::Migration
  def change
    create_table :vk_publics do |t|
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end
end
