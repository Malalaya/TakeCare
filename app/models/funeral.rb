class Funeral < ApplicationRecord
  belongs_to :user
  has_many :flowers
  has_many :guests
  has_many :venues
  has_many :funeral_homes
end
