class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true

  has_many :topics
  has_secure_password
end
