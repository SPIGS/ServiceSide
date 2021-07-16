class AddOrgToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organization, :string, unique: true, allow_blank: true
  end
end
