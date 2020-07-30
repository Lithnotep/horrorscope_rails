class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :event
      t.string :members
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
