class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.belongs_to :wishable, polymorphic: true
      t.timestamps
    end
  end
end
