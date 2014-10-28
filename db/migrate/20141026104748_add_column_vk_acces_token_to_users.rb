class AddColumnVkAccesTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vk_access_token, :string
  end
end
