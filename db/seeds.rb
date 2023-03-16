# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# User.destroy_all
# Funeral.destroy_all

# 5.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     password: 123456,
#     name: Faker::Name.first_name,
#     surname: Faker::Name.last_name,
#     address: Faker::Address.country,
#     birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
#   )
#   file = File.open(Rails.root.join("app/assets/images/avatar.png"))
#   user.avatar.attach(io: file, filename: "nes.png", content_type: "image/png")
#   user.save
#   Funeral.create(user: user)
# end

# User.first.avatar.attach(io: File.open(File.join(Rails.root, 'app/assets/images/avatar.png')), filename: 'avatar.png')

Flower.destroy_all

puts "Flowers destroyed"
puts "Creating flowers"

roses = Flower.new(name: "Roses")
roses.photo.attach(io: URI.open('https://images.photowall.com/products/61963/white-roses-on-black-background.jpg?h=699&q=85'), filename: 'roses.jpg')
roses.save!
lilies = Flower.new(name: "Lilies")
lilies.photo.attach(io: URI.open('https://images.unsplash.com/photo-1567428051128-5f09a0200655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), filename: 'lilies.jpg')
lilies.save!
orchids = Flower.new(name: "Orchids")
orchids.photo.attach(io: URI.open('https://www.gardeningknowhow.com/wp-content/uploads/2020/11/orchid-flowers.jpg'), filename: 'orchids.jpg')
orchids.save!
tulips = Flower.new(name: "Tulips")
tulips.photo.attach(io: URI.open('https://images.unsplash.com/photo-1615669527168-8766827a7159?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'), filename: 'tulips.jpg')
tulips.save!
hyacinth = Flower.new(name: "Hyacinth")
hyacinth.photo.attach(io: URI.open('https://cdn.shopify.com/s/files/1/0620/2749/7724/products/hyacinth-blue-mix-cp-4.jpg?v=1653401335&width=1946'), filename: 'hyacinth.jpg')
hyacinth.save!
