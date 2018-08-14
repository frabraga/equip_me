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
