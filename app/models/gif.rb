class Gif < ActiveRecord::Base
  belongs_to :category

  has_many :favorite_gifs, dependent: :destroy
  has_many :users, through: :favorite_gifs

  validates :image_path, presence: true, uniqueness: {scope: :category_id}

  def self.grouped_by_category
    joins(:category).group(['categories.name', 'gifs.id'])
  end
end
