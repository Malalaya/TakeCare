class Guest < ApplicationRecord
  belongs_to :funeral
  validates :funeral, presence: true

  def guest_count
    guest_list.split(",").count
  end
end
