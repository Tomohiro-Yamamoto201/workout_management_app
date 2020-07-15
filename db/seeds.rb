# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(nickname:  "Example User",
             email: "example@example",
             gender: 1,
             height: 170,
             body_weight: 60,
             born_on: "2000-04-01",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
training_menu_1 = TrainingMenu.create!(training_menu: "腕立て伏せ", user_id: user_1.id)
training_menu_2 = TrainingMenu.create!(training_menu: "腹筋", user_id: user_1.id)
training_menu_3 = TrainingMenu.create!(training_menu: "背筋", user_id: user_1.id)
training_report_1 = TrainingReport.create!(content: "レポート１", user_id: user_1.id)
