class Guest < ApplicationRecord
  belongs_to :funeral
  validates :funeral, presence: true

  def guest_count
    if guest_list.nil?
      return 
    elsif guest_list.match?(/\d+/)
      guest_list.contains?("/\d+/")
      return guest_list.scan(/\d+/).map(&:to_i).sum
    elsif guest_list.is_a?(String)
      guest_list.split(",").count
    end
  end
end
