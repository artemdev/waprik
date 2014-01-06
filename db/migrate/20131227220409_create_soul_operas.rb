class CreateSoulOperas < ActiveRecord::Migration
  def change
    create_table :soul_operas do |t|

      t.timestamps
    end
  end
end
