class Reservation < ApplicationRecord
  belongs_to :room
  has_many :breakfasts

  has_and_belongs_to_many :users

end
