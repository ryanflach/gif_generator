class User < ActiveRecord::Base
  has_secure_password

  has_many :favorite_gifs
  has_many :favorites, through: :favorite_gifs, source: :gif
end
