module CategoriesHelper
  def categories
    Category.priority_order
  end

  def class_visible
    return 'd-flex' if logged_in?

    'd-none'
  end
end
