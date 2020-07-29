class CreateEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.float :relative_velocity_mph
      t.float :lunar_distance
      t.date :event_date
      t.references :harbinger, foreign_key: true
    end
  end
end
