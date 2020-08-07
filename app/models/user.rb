class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, format: { with: /\A[\w-]+\z/, message: "doesn't meet format requirements" }
  validates :username, uniqueness: true, presence: true
end
