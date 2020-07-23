class DailyHarbinger < ApplicationRecord
  belongs_to :harbinger
  belongs_to :daily_message
end
