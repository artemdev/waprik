class AddColumnCategorableToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :categorable_id, :integer
    add_column :categories, :categorable_type, :string
  end
end
