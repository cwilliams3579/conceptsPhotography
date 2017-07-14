# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name: "Jack", last_name: "Henry", email: "jack@gmail.com", password: "password", admin: true)
User.create!(first_name: "Tom", last_name: "Cruise", email: "tom@gmail.com", password: "password", admin: false)
User.create!(first_name: "John", last_name: "Doe", email: "john@gmail.com", password: "password", admin: false)
