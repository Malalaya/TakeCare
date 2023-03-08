class Guest < ApplicationRecord
  belongs_to :funeral
  validates :funeral, presence: true
end
