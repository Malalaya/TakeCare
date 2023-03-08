class Relative < ApplicationRecord
  belongs_to :user
  belongs_to :funeral
  validates :user, uniqueness: { scope: :funeral }
  validates :funeral, uniqueness: { scope: :user }
  validates :trusted, inclusion: { in: [true, false] }
end
