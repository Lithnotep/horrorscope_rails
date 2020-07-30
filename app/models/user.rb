class User < ApplicationRecord
  validates_presence_of :name
  has_many :personal_messages
  has_many :harbinger_users
  has_many :harbingers, through: :harbinger_users

  def self.create_from_omniauth(auth)
    user = User.where(email: auth.info[:email]).first

    unless user
      user = User.create(
        name: auth.info[:name],
        email: auth.info[:email]
        )
    end
    user
  end
  # def self.create_from_omniauth(auth)
  #   user = User.where(email: auth.info[:email]).first_or_initialize do |user|
  #     user.name = auth.info[:name]
  #     user.email = auth.info[:email]
  #   end
  # end
  # def self.from_omniauth(access_token)
  #    data = access_token.info
  #    user = User.where(:email => data["email"]).first
  #
  #    unless user
  #      user = User.create(
  #            name: data["name"],
  #            email: data["email"],
  #            encrypted_password: Devise.friendly_token[0,20]
  #      )
  #    end
  #    user
  #  end

end
