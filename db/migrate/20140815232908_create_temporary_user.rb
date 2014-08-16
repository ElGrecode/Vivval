class CreateTemporaryUser < ActiveRecord::Migration
  def up
    create_table :temporary_users do |t|
      t.string :email
      t.string :uuid, limit: 36, primary_key: true
    end
  end

  def down
    drop_table :temporary_users
  end
end
