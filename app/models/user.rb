class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :families, dependent: :destroy
  has_many :funerals, dependent: :destroy
  has_many :relatives, through: :funerals, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :background_picture
  after_create :create_funeral

  def create_funeral
    Funeral.create(user: self)
  end

  def invitations(funeral)
    Relative.where(user: self, funeral: funeral)
  end
end
