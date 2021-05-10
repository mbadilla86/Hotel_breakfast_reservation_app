class Reservation < ApplicationRecord
  after_create :generate_breakfasts
  belongs_to :room
  has_many :breakfasts

  has_and_belongs_to_many :users, before_add: :schedule_breakfasts

  def schedule_breakfasts(user)
    breakfasts.each { |breakfast| user.user_breakfasts.build(breakfast: breakfast) }
  end

  def generate_breakfasts
    days = (end_date - start_date).to_i
    breakfast_dates = (1..days).to_a.map { |n| start_date + n.days }
    breakfast_dates.each { |current_date| self.breakfasts.build(date: current_date) }
  end
end
