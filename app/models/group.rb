class Group < ApplicationRecord
  belongs_to :user
  has_many :presentations

  validates :name, presence: true
end
