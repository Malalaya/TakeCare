# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 123456,
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    address: Faker::Address.street_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  file = File.open(Rails.root.join("app/assets/images/avatar.png"))
  user.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
  user.save
  Funeral.create(user: user)
end
