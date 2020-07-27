class CreateHarbingers < ActiveRecord::Migration[5.2]
  def change
    create_table :harbingers do |t|
      t.string :name
      t.integer :neo_id

      t.timestamps
    end
  end
end
