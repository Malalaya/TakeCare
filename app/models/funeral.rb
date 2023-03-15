class Funeral < ApplicationRecord
  belongs_to :user
  has_one :funeral_flower, dependent: :destroy
  has_many :flowers, through: :funeral_flower, dependent: :destroy
  has_one :guest, dependent: :destroy
  has_one :funeral_home, dependent: :destroy
  has_one :venue , dependent: :destroy
  validates :user, presence: true, uniqueness: true
  has_many :relatives, dependent: :destroy
  has_many_attached :documents
  has_rich_text :informal_will
  has_rich_text :health
end
