10.times do
    User.create!(email: Faker::Internet.email('Nancy'), password: "123456", password_confirmation: "123456")
end

users = User.all

100.times do
    Wiki.create!(title: Faker::Name.title, body: Faker::Lorem.paragraph, private: Faker::Boolean.boolean, user: users.sample)
end


puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"

