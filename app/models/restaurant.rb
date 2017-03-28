class Restaurant < ApplicationRecord
  has_many :events
  has_many :dishes, through: :menus
  has_many :menus
  has_many :users
end
