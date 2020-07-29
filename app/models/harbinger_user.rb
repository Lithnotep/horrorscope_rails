class HarbingerUser < ApplicationRecord
  belongs_to :harbinger
  belongs_to :user
end
