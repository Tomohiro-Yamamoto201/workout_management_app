# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create!(nickname:  "Example User",
             email: "example@example1",
             gender: 1,
             height: 170,
             body_weight: 60,
             born_on: "2000-04-01",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
             
training_menu_1 = TrainingMenu.create!(training_menu: "腕立て伏せ", user_id: 1)
training_menu_2 = TrainingMenu.create!(training_menu: "腹筋", user_id: 1)
training_menu_3 = TrainingMenu.create!(training_menu: "背筋", user_id: 1)
training_report_1 = TrainingReport.create!(content: "レポート１", user_id: 1)
training_1 = Training.create!(title: "腕立て伏せ", content: "15回3セット", start_time: "2020-10-14 8:30", growing_parts: "大胸筋", training_menu_id: 1)
training_2 = Training.create!(title: "腹筋", content: "20回3セット", start_time: "2020-10-15 9:30", growing_parts: "腹直筋", training_menu_id: 2)
training_3 = Training.create!(title: "背筋", content: "10回3セット", start_time: "2020-10-16 10:30", growing_parts: "広背筋", training_menu_id: 3)