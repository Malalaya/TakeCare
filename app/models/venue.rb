class Venue < ApplicationRecord
  belongs_to :funeral
  validates :name, presence: true
  validates :address, presence: true
  validates :funeral, presence: true
end
