User.destroy_all
Story.destroy_all
Story::Comment.destroy_all

puts 'DB cleaned'

10.times do
  User.create! name: Faker::Name.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456"
  print '.'
end

puts 'Users created!'

10.times do |i|
  Story.create! title: "Task #{i+1}", body: "Descroption for task #{i}", assigner_id: User.all[i].id, assignee_id: User.all[9-i].id
  print '.'
end

puts 'Stories created!'

30.times do |i|
  Story.all[(i+1)%10].comments.create body: "Witty comment #{i+1}", user_id: User.all[(i+1)%10].id
  print '.'
end

puts 'Comments created!'