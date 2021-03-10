module CategoriesHelper
  def categories
    Category.priority_order
  end
end
