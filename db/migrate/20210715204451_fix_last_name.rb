class FixLastName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :lastname, :lname
  end
end
