# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

50.times do |n|
  task1 = "タスク#{n}"
  task2 = "タスク詳細#{n}"
  Task.create!(name: task1,
               description: task2,
               user_id: 1)
end

50.times do |n|
  task1 = "タスク#{n}"
  task2 = "タスク詳細#{n}"
  Task.create!(name: task1,
               description: task2,
               user_id: 2)
end

50.times do |n|
  task1 = "タスク#{n}"
  task2 = "タスク詳細#{n}"
  Task.create!(name: task1,
               description: task2,
               user_id: 3)
end
