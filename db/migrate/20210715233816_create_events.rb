class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name 
      t.string :desc
      t.integer :org_id
      t.integer :num_needed
      t.timestamps
    end
  end
end
