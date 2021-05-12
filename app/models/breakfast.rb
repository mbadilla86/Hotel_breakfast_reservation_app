class Breakfast < ApplicationRecord
  after_create :generate_user_breakfasts
  belongs_to :reservation
  has_many :user_breakfasts
  has_many :users, through: :user_breakfasts

  def generate_user_breakfasts
    users = self.reservation.users
    users.map do |user|
      ub = user.user_breakfasts.new(breakfast: self)
    end
  end
end
