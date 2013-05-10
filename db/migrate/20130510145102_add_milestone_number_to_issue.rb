class AddMilestoneNumberToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :milestone_number, :integer
  end
end
