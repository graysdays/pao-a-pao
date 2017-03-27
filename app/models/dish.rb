class Dish < ApplicationRecord
  has_many :restaurants, through: :menus
  has_many :menus
end
