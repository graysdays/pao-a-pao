class Restaurant < ApplicationRecord
  has_many :events, through: :agendas
  has_many :agendas
  has_many :dishes, through: :menus
  has_many :menus
  has_many :users
end
