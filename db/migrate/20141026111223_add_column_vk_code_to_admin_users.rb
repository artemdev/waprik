class AddColumnVkCodeToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :vk_code, :string
  end
end
