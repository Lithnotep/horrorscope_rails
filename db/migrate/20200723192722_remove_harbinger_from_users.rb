class RemoveHarbingerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :harbinger, foreign_key: true
  end
end
