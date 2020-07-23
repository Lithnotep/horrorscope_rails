class PersonalMessage < ApplicationRecord
  validates_presence_of :description, :date
  belongs_to :user
end
