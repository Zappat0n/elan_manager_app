class User < ApplicationRecord
  has_many :presentations

  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: [:name]

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
end
