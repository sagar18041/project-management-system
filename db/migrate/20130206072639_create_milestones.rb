class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.integer :project_id

      t.timestamps
    end
  end
end
