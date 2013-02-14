class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.integer :milestone_id
      t.integer :user_id

      t.timestamps
    end
  end
end
