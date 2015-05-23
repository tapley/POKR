require 'faker'

5.times do
  user = User.create(
    name: Faker::Name.name,
    password_hash: Faker::Internet.password,
    email: Faker::Internet.email
  )
  5.times do
    objective = Objective.create(
      user_id: user.id,
      description: Faker::Lorem.sentence,
      due: Faker::Date.forward(rand(1..100))
    )

    5.times do
      Keyresult.create(
        objective_id: objective.id,
        num: rand(1..10),
        unit: Faker::Lorem.word,
        action: Faker::Lorem.sentence
      )
    end
  end
end