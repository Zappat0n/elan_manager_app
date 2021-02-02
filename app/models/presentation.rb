class Presentation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :group, optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
