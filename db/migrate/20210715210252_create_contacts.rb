class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
