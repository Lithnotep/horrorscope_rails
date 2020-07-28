class User < ApplicationRecord
  validates_presence_of :name
  has_many :personal_messages
  has_many :harbinger_users
  has_many :harbingers, through: :harbinger_users

  def self.create_from_omniauth(auth)
    where(email: auth.info[:email]).first_or_initialize do |user|
      user.name = auth.info[:name]
      user.email = auth.info[:email]
    end
  end
end
