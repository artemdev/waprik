class ChangeColumnCreatedAtInFilms < ActiveRecord::Migration
  def up
  	change_column :films, :created_at, :datetime
  end

  def down
  	change_column :films, :created_at, :integer
  end
end
