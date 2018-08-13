# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all fucks"
Equipment.destroy_all

puts "adding equipment"

equipment_attributes = {
  name: "bat",
  description: "really fucking cool bat",
  price: 125,
  user_id: 1
}

5.times { Equipment.new(equipment_attributes).save }

puts "complete"
