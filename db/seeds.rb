15.times do
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )
end
users =  User.all

25.times do
  Wiki.create(
    title: Faker::Zelda.character,
    body: Faker::DumbAndDumber.quote,
    user: users.sample
  )
end
