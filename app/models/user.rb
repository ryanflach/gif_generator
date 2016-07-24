class User < ActiveRecord::Base
  has_secure_password

  has_many :favorite_gifs, dependent: :destroy
  has_many :favorites, through: :favorite_gifs, source: :gif

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: [:default, :admin]
end
