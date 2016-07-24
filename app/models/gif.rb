class Gif < ActiveRecord::Base
  belongs_to :category

  has_many :favorite_gifs, dependent: :destroy
  has_many :users, through: :favorite_gifs

  validates :image_path, presence: true, uniqueness: {scope: :category_id}

  def self.grouped_by_category
    category_gifs = Hash.new{|h, k| h[k] = []}
    all.each {|gif| category_gifs[gif.category.name] << gif}
    category_gifs
    # joins(:category).group(['categories.name', 'gifs.id'])
  end
end
