class CreateDailyMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_messages do |t|
      t.string :description
      t.string :date

      t.timestamps
    end
  end
end
