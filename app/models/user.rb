class User < ApplicationRecord
  has_many :external_presentations, -> { where('group_id IS NULL') },
           class_name: 'Presentation', foreign_key: 'author_id', dependent: :destroy
  has_many :presentations, -> { where('group_id IS NOT NULL') }, foreign_key: 'author_id', dependent: :destroy

  has_many :groups, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: [:name]

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }

  has_one_attached :avatar, dependent: :destroy
  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?

    errors.add(:avatar, 'is too big. Maximun size 1MB.') unless avatar.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:avatar, 'must be a JPEG or PNG') unless acceptable_types.include?(avatar.content_type)
  end
end
