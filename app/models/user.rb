class User < ApplicationRecord
  validates_presence_of :name
  belongs_to :harbinger
  has_many :personal_messages

  def self.from_omniauth(auth)
    require "pry"; binding.pry
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
