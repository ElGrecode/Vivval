class CreateBlazons < ActiveRecord::Migration
  def change
    create_table :blazons do |t|
      t.string :uuid
      t.references :user
      t.string :body, limit: 150
      t.string :promotions
      t.string :geolocation

      t.timestamps
    end
  end
end
