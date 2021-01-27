class User < ApplicationRecord
  has_many :external_presentations, -> { where('group_id IS NULL') },
           class_name: 'Presentation', foreign_key: 'author_id'
  has_many :presentations, -> { where('group_id IS NOT NULL') }, foreign_key: 'author_id'

  has_many :groups, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: [:name]

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }

  has_one_attached :avatar
  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
