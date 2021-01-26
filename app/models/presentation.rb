class Presentation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :amount, presence: true
end
