class AddColumnVkUserIdToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :vk_user_id, :integer
  end
end
