# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.delete_all

users = 1000.times.map do
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    job: Faker::Job.title,
    address: Faker::Address.full_address,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone_number: Faker::PhoneNumber.cell_phone,
    gender: Faker::Gender.binary_type,
    email: Faker::Internet.email
  )
end

User.import users
