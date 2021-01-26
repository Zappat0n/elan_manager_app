class User < ApplicationRecord
  has_many :presentations

  devise :database_authenticatable, authentication_keys: [:name]

  validates :email, uniqueness: true
  validates :name, uniqueness: true
end
