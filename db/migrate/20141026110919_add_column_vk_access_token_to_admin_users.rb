class AddColumnVkAccessTokenToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :vk_access_token, :string
  end
end
