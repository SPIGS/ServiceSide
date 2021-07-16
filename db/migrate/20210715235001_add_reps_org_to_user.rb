class AddRepsOrgToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reps_org, :boolean
  end
end
