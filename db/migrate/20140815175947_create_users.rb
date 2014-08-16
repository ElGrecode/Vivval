class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|
      t.string :uuid, limit: 36, primary: true
      t.string :first_name, :last_name, :email
      t.string :hashed_password
      t.timestamps
    end
  end
end
