# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name: "Jack", last_name: "Henry", email: "jack@gmail.com", password: "password", admin: true)
5.times {User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.free_email, password: "password", admin: false)}
2.times {Post.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph(2), user:User.first)}
2.times {Post.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph(2), user:User.second)}
2.times {Post.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph(2), user:User.last)}