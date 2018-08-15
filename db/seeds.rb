puts "destroying all fucks"
Equipment.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all

puts "adding all fucks"

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

photos = [
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344769/a7hattlipiddwumpfb24.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344770/kdxeuqi4tcn2hc0osh3e.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344773/kadlhcphio3ahb37dchj.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344765/xymyzcskkwxzgyyox4lt.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344771/r8alcq7cuo6q6bw43uk0.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344767/thkyz9qla9crse8owrvz.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344764/fyodsdxat0xxlho0khvd.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344761/bm26blws9hzp2m4vtcde.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344754/pvxgkbqzfhf14gplcke1.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344759/k3gqyzdl5uzrxmaogqrg.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344740/epgflc09ibmkokphv1g8.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344739/jz5jzup3wp2ws5cebp4u.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344735/d1agib7oiwpd8kjgpjid.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344746/bpopov3xzaidk77myo3q.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534344731/mgxhkie9neavspdjvm5k.jpg"
]

sports = [
"kite surfing",
"wake boarding",
"snow boarding",
"skiing",
"surfing",
"football",
"baseball",
"golf",
"water polo",
"real polo",
"paragliding",
"luging",
"horseing around",
"cricket",
"croquet",
"conkers",
"tennis",
"ping pong",
"badminton",
"basketball",
"hockey"
]

equipment = [
"bat",
"skis",
"racket",
"armour",
"horse",
"boat",
"oars",
"snowboard",
"skateboard",
"kite",
"ball"
"baseball"
"basketball"
"shuttlecock",
"ping pong ball",
"jacket",
"pants",
"wingsuit",
"clubs",
"canoe",
"paddle board"
]

10.times do
  equipment = Equipment.new(
    name: equipment.sample,
    description: Faker::Lorem.paragraphs,
    price: rand(50..500),
    user_id: rand(1..10),
    category: sports.sample,
    remote_photo_url: photos.sample
  )
  equipment.save!
end

15.times do
  booking = Booking.new(
    user_id: rand(1..10),
    equipment_id: rand(1..10),
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.forward(rand(5..23))
  )
  booking.save!
end

30.times do
  review = Review.new(
    description: Faker::Lorem.paragraphs(1),
    rating: rand(0..5),
    booking_id: rand(1..15)
  )
  review.save!
end

puts "completed the fuckening"

# equipment / name, descrip, price, user_id
# user / first-name, last-name, address, email, password (6 char)
# booking / user-id, equip-id, start-date, end-date
# review / description, booking-id
