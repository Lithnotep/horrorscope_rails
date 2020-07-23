class User < ApplicationRecord
  validates_presence_of :name
  belongs_to :harbinger
  has_many :personal_messages
end
