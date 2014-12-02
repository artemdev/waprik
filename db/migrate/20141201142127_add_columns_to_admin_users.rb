class AddColumnsToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin, :boolean
    add_index :admin_users, :admin
  end
end
