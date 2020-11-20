# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "abcd@gmail.com", password: "1234567")

Artwork.create!(user: user, title: "2 Dancers", category: "oil painting", artist: "Picasso", description: "Sharp ", price: 99, location: "london" )
Artwork.create!(user: user, title: "The Raft of Medusa", category: "oil painting", artist: "Gericault", description: "held at the Louvre Museum - life size", price: 99, location: "london")
Artwork.create!(user: user, title: "Starry Night", category: "oil painting", artist: "Van Gogh", description: "beautfil evening", price: 99, location: "london")

