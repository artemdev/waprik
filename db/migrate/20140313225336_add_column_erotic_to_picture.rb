class AddColumnEroticToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :erotic, :boolean
  end
end
