# db/seeds.rb

require 'faker'

# 1. Clean the database 🗑️
Review.destroy_all
Restaurant.destroy_all

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

# 2. Create the instances 🏗️
5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
end

puts "✅ Created #{Restaurant.count} restaurants!"
