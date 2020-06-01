# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(nickname:  "Example User",
             email: "example@railstutorial.org",
             gender: "男",
             height: "170",
             body_weight: "60",
             born_on: "20000401",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
