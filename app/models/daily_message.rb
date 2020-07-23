class DailyMessage < ApplicationRecord
  validates_presence_of :description, :date
  has_many :daily_harbingers
  has_many :harbingers, through: :daily_harbingers
end
