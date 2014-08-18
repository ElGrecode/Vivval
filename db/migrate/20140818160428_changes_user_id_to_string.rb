class ChangesUserIdToString < ActiveRecord::Migration
  def up
    remove_column :blazons, :user_id
    add_column :blazons, :user_id, :string
  end
  def down
    remove_column :blazons, :user_id
  end
end
