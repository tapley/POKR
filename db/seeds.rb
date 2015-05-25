require 'faker'

5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
  user.password = "1234"
  user.save!
  5.times do
    objective = Objective.create(
      user_id: user.id,
      description: Faker::Lorem.sentence,
      due: Faker::Date.forward(23)
    )

    5.times do
      Keyresult.create(
        objective_id: objective.id,
        goal: rand(11..20),
        number: rand(1..10),
        unit: Faker::Lorem.word,
        action: Faker::Lorem.sentence
      )
    end
  end
end
