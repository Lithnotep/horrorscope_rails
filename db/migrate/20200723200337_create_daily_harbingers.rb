class CreateDailyHarbingers < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_harbingers do |t|
      t.references :harbinger, foreign_key: true
      t.references :daily_message, foreign_key: true

      t.timestamps
    end
  end
end
