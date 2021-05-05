class UserBreakfast < ApplicationRecord
  belongs_to :breakfast
  belongs_to :user
end
