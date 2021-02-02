class Presentation < ApplicationRecord
  scope :grouped_presentations, -> { joins(:groups_presentations).where('groups_presentations.group_id IS NOT NULL') }
  scope :external_presentations, -> { left_outer_joins(:groups_presentations).where('groups_presentations.group_id IS NULL') }

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups, optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true
end
