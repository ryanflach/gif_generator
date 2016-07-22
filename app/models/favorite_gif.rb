class FavoriteGif < ActiveRecord::Base
  belongs_to :user
  belongs_to :gif

  validates :gif_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :gif_id}
end
