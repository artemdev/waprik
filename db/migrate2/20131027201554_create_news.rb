class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :description
    	t.string :section
    	t.boolean :visible
      t.timestamps
    end
  end
end
