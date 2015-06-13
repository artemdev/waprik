class AddColumnAmountToAdsLinks < ActiveRecord::Migration
  def change
    add_column :ads_links, :amount, :integer, default: 0
    add_index :ads_links, :amount
  end
end
