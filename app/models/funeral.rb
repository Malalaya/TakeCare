class Funeral < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :flower
  has_one :guest
  has_one :funeral_home
  has_one :venue
  validates :user, presence: true, uniqueness: true
end
