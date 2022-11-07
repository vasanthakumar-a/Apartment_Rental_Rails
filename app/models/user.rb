class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: :true
  validates_length_of :phonenumber, minimum: 10, maximum: 10, allow_blank: false
  validates_uniqueness_of :email, presence: :true

  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
