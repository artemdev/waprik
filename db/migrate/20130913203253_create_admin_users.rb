class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
    	t.string "username"
    	t.string "first_name"
      t.string "last_name"
    	t.string "hashed_password"
    	t.string "salt"
    	t.string "email"
      t.timestamps
    end
  end
end
