class UserBreakfast < ApplicationRecord
  belongs_to :breakfast
  belongs_to :user

  enum place: ['Comedor', 'Terraza', 'Salón', 'Piscina']
  enum time: ['7:00','7:30','8:00','8:30','9:00','9:30','10:00','10:30']

end
