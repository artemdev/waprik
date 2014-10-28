class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :visitable, polymorphic: true, index: true
      t.belongs_to :fromable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
