class Group < ApplicationRecord
  belongs_to :user
  has_many :presentations

  validates :name, presence: true

  has_one_attached :avatar
  validate :acceptable_image
end
