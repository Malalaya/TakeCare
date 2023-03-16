class Flower < ApplicationRecord
  has_one_attached :photo
  has_many :funeral_flowers, dependent: :destroy
end
