class AddColumnVkToSerialSeries < ActiveRecord::Migration
  def change
    add_column :series, :vk, :boolean
  end
end
