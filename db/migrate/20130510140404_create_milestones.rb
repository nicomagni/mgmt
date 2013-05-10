class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :number
      t.date :start_date
      t.date :due_date
      t.decimal :estimated_hours
      t.decimal :client_estimated_hours

      t.references :project

      t.timestamps
    end
  end
end
