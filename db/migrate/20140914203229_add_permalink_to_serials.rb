class AddPermalinkToSerials < ActiveRecord::Migration
  def change
    add_column :serials, :permalink, :string
    add_index :serials, :permalink
  end
end
