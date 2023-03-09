class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :families
  has_many :relatives
  has_many :funerals, through: :relatives, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :background_picture
end
