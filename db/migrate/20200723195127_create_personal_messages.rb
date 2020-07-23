class CreatePersonalMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_messages do |t|
      t.string :description
      t.string :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
