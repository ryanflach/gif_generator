module CategoryHelper
  def categories
    Category.all.map { |cat| [cat.name, cat.id] }
  end
end
