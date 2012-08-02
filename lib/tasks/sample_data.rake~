namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_ideas
    make_followships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_ideas
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.ideas.create!(content: content) }
  end
end

def make_followships
  users = User.all
  ideas = Idea.all
  idea = Idea.first
  user  = users.first
  followed_ideas = ideas[2..50]
  followers      = users[3..40]
  followed_ideas.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(idea) }
end