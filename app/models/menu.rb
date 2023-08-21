class Menu < ApplicationRecord
  enum dish_type: ['Main Course', 'Salad', 'Dessert' ,'Veg', 'Nonveg']
end
