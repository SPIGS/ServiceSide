class AddEventId < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :event_id, :integer
  end
end
