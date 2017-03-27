class Event < ApplicationRecord
  has_many :restaurants, through: :agendas
  has_many :agendas
end
