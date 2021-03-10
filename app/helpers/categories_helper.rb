module CategoriesHelper
   def categories
    categories = Category.priority_order
   end 
end
