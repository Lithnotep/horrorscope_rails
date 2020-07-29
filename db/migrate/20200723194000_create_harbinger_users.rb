class CreateHarbingerUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :harbinger_users do |t|
      t.references :user, foreign_key: true
      t.references :harbinger, foreign_key: true
    end
  end
end
