class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :presentations

  validates :name, presence: true

  has_one_attached :avatar
  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?

    errors.add(:avatar, 'is too big. Maximum size 1MB.') unless avatar.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:avatar, 'must be a JPEG or PNG') unless acceptable_types.include?(avatar.content_type)
  end
end
