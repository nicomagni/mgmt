class AddPriorityToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :priority, :integer, default: 0
  end
end
