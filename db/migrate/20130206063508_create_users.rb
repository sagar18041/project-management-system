class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.text :user_address

      t.timestamps
    end
  end
end
