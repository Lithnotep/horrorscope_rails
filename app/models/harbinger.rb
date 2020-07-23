class Harbinger < ApplicationRecord
  validates_presence_of :name, :neo_id
  has_many :users
  has_many :daily_harbingers
  has_many :daily_messages, through: :daily_harbingers
end
