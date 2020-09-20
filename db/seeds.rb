# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "管理者",
             email: "admin@gmail.com",
             password:  "adminsan",
             password_confirmation: "adminsan",
             admin: true)

10.times do |n|
 name = Faker::Games::Pokemon.name
 email = Faker::Internet.email
 password = "password"
 User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              )
end

Label.create!(name:  "開発")
Label.create!(name:  "運用")
Label.create!(name:  "高利益案件")
Label.create!(name:  "赤字案件")
Label.create!(name:  "経理")
Label.create!(name:  "総務")
Label.create!(name:  "営業")
Label.create!(name:  "経営企画")
Label.create!(name:  "システム")
Label.create!(name:  "注意！")

n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
n = 0
10.times do |n|
 name = Faker::Job.title
 content = Faker::Job.field
 n += 1
 user_id = n
 Task.create!(name: name,
              content: content,
              user_id: n
              )
end
