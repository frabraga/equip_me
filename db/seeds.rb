puts "destroying all fucks"
Equipment.destroy_all
User.destroy_all
Booking.destroy_all
Review.destroy_all

puts "adding all fucks"

addresses = [
"WeWork Ipanema",
"Blue Agave Ipanema",
"Posto 10, Rio",
"posto 9, Rio",
"Posto 8, Rio",
"Shopping Leblon, Rio",
"Jockey Club Brasileiro, Gavea",
"Cristo Redenter, Rio",
"Praca do Lido, Copacabana",
"Copacabana Palace",
"lagoa rodrigo de freitas"
]
count = 0
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses[count],
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
  count += 1
end

User.create(email: "user@user.com", password: "123456", first_name: "Francisco", last_name: "Braga", address: "WeWork Ipanema")

photos = [
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534517050/dk2ytlf3hdrmsjwftjic.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534367299/awdlytiryivaehkuz58f.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534367951/vqvynkozgrhqwizc1kbg.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534367124/lhzv7ue7tyhdfzqtl8cl.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534367072/vhfvpfhpwkxog3q4jgwk.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534366891/ljigbtbr3hk5mw4fr3ww.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534365130/avpgrstibxgzlipzfpig.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534365106/aopkngewojvwsjnziwqg.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534365064/lwavycjtv71lwbayaccu.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534365031/c5gc1ajvxxm4i0byth9z.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534364915/sjevtuc10hy5teqxelke.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534364849/qoiwpizphroxjxs1x79t.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534445522/z3th1jdlkbdluwcncw8a.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534517350/ty0tizwjaec3cprgtcma.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534517221/bniacnydga9khw8uq9qu.jpg",
"https://res.cloudinary.com/djjncf5oe/image/upload/v1534517126/jjlxxlqedox4gq1cv4rm.png"
]

sports = [
"Flying squirl",
"lugeing",
"skiing",
"horseing around",
"golf",
"snowboarding",
"skiing",
"boating",
"kitesurfing",
"boating",
"baseball",
"wakeboarding",
"surfing",
"tennis",
"cricket",
"boating"
]

stuff = [
"wingsuit",
"luge",
"skiing set",
"my dumb horse",
"golf club set",
"snowboard",
"skis",
"oars",
"kitesurf",
"boat",
"baseball bat",
"wakeboard",
"surf",
"tennis rackets",
"cricket bats",
"canoe"
]

descriptions = [
"Fly around like a squirl. Just don't crash or hit anything. Otherwise you're probably dead. ...so good luck! I have yet to have a repeat customer..",
"..honestly i don't know how you use this just randomly..but why not rent it out and make bank?",
"for skiing and other snowy fun.",
"play real polo, with a real horse. ssssuuuuuppppp. Bojack Horseman!",
"for anyone like myself who plays a useless 'sport'...when something else in life stops working, you take up golf. am i right??",
"a board that you can snow on...i mean ski...i mean..snowboard? the fuck? cheapest way to break your legs.",
"for skiing and other snowy fun.",
"beautiful oars. for pushing yourself around in the water. if you have some sort of boat, dingy, float, board. otherwise it's just good for hitting people or yourself. or working out bro.",
"kitesurfing brah. just the coolest, damnest thing on the planet. right steve?",
"You get to sing the Lonely Island song 'I'm on a boat'. So dope it's woke.",
"You can hit balls. Hit people. Just hit hit hit hit. ..swing away!",
"awesome wakeboard brah, you will truly love it. made me sooo happy. and everyone sooo happy. aiiight",
"surfing is just too cool for school. unless of course you can't. ..then you just suck brah",
"for all those people who like to go to rich person 'clubs'. know what i mean?",
"cricket...the sport for souls of the damned. the baseball of the commonwealth.",
"a canoe. you can have your own Deliverance experience. Also, the canoe comes with the dog."
]

count = 0
15.times do
  equipment = Equipment.new(
    name: stuff[count],
    description: descriptions[count],
    price: rand(50..500),
    user_id: rand(1..11),
    category: sports[count],
    remote_photo_url: photos[count]
  )
  equipment.save!
  count += 1
end

15.times do
  booking = Booking.new(
    user_id: rand(1..11),
    equipment_id: rand(1..15),
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.forward(rand(5..23))
  )
  booking.save!
end

30.times do
  review = Review.new(
    description: Faker::Lorem.paragraph_by_chars(80, false),
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
