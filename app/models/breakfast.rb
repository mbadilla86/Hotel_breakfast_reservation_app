class Breakfast < ApplicationRecord
  belongs_to :reservation
  has_many :user_breakfasts
  has_many :users, through: :user_breakfasts
end
