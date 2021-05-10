# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create(first_name: 'Mauricio', last_name: 'Badilla', email: 'hola@hola.com', password: '12341234')

hotel = Hotel.create(name: 'California', phone: '123456789')
puts "Se ha creado el hotel: #{hotel.name}"

admin.hotels << hotel

3.times do |num| 
  room = hotel.rooms.create(number: num + 1)
  puts "Se ha creado el room: #{room.number}"
end

room = Room.first
reservation = room.reservations.create(start_date: Date.parse('2021-05-04'), end_date: Date.parse('2021-05-11') )
puts "Se ha creado la reserva de la pieza: #{reservation.room.number} que inicia el: #{reservation.start_date}"

7.times do |nu|
  r = reservation.breakfasts.create(date: Date.parse("2021-05-#{nu + 5}"))
  puts "Se ha creado el desayuno del día: #{r.date}"
end

users_names = ['Juan', 'Ana', 'Julia', 'Pedro']
users = users_names.map do |name|
  u = User.new(email: "#{name.downcase}@example.com", first_name: name, last_name: 'Pérez', password: 123123)
  reservation.users << u
end

# reservation.breakfasts.map do |breakfast|
#   time = (0..7).to_a.sample
#   place = (0..3).to_a.sample

#   reservation.users.map do |user|
#     br = breakfast.user_breakfasts.create(user: user, time: time, place: place)
#     puts "#{br.user.first_name} desayunará el día #{breakfast.date} a las #{br.time} en #{br.place}"
#   end
# end
