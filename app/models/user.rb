class User < ApplicationRecord
  has_many :presentations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]

  # validates :email, uniqueness: true
  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
end
