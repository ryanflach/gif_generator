require 'faraday'
require 'json'

module GifHelper
  def fetch_data(category)
    Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{category}&limit=20&api_key=dc6zaTOxFJmzC")
  end

  def parse_data(category)
    JSON.parse(fetch_data(category).body, object_class: OpenStruct)
  end

  def image_url(category)
    parse_data(category).data[num_gifs_in_category(category) + 1].images.fixed_height.url
  end

  def num_gifs_in_category(category)
    category = Category.find_by(name: category)
    if category.nil? || category.gifs.count == 0
      -1
    else
      category.gifs.count
    end
  end
end
