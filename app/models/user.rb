class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :preps
  
  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
