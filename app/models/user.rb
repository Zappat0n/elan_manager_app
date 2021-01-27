class User < ApplicationRecord
  has_many :presentations_external, -> { where('group_id IS NULL') }, class_name: 'Presentation', foreign_key: 'author_id'
  has_many :external_presentations, through: :presentations_external, source: :author

  has_many :presentations, -> { where('group_id IS NOT NULL') }, foreign_key: 'author_id'

  has_many :groups, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: [:name]

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
  has_one_attached :avatar
end
