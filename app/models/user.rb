class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_breakfasts
  has_many :breakfasts, through: :user_breakfasts​
  has_and_belongs_to_many :reservations
  
  # , before_add: :schedule_breakfasts

  # def schedule_breakfasts(reservation)
  #   reservation.breakfasts.each { |breakfast| self.user_breakfasts.build(breakfast: breakfast) }
  # end
end
