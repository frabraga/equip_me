require 'faker'

puts "destroying all fucks"
Equipment.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all

puts "adding all fucks"

100.times do
  equipment = Equipment.new(
    name: Faker::Pokemon.move,
    description: Faker::StarWars.quote,
    price: rand(50..500),
    user_id: rand(1..10)
  )
  equipment.save!
end

10.times do
  user = User.new(
    first_name: Faker::StarWars.specie,
    last_name: Faker::StarWars.planet,
    address: Faker::RockBand.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

30.times do
  booking = Booking.new(
    user_id: rand(1..10),
    equipment_id: rand(1..100),
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.forward(rand(5..23))
  )
  booking.save!
end

50.times do
  review = Review.new(
    description: Faker::StarWars.wookiee_sentence,
    booking_id: rand(1..30)
  )
end

puts "completed the fuckening"

# equipment / name, descrip, price, user_id
# user / first-name, last-name, address, email, password (6 char)
# booking / user-id, equip-id, start-date, end-date
# review / description, booking-id
