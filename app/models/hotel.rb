class Hotel < ApplicationRecord
  has_many :rooms
  has_many :admins

end
