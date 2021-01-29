class Presentation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
