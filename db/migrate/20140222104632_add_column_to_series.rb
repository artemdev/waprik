class AddColumnToSeries < ActiveRecord::Migration
  def change
    add_column :series, :number, :integer, default: 0
  end
end
