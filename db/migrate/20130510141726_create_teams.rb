class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :project
      t.references :user

      t.timestamps
    end

    add_index :teams, :user_id
    add_index :teams, :project_id
  end
end
