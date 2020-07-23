class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :birthday, default: nil
      t.string :password_digest
      t.references :harbinger, foreign_key: true

      t.timestamps
    end
  end
end
