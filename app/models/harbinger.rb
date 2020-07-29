class Harbinger < ApplicationRecord
  validates_presence_of :neo_id
  has_many :harbinger_users
  has_many :users, through: :harbinger_users
  has_many :daily_harbingers
  has_many :daily_messages, through: :daily_harbingers
end
