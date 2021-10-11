# spec/factories/todos.rb
FactoryBot.define do
    factory :analytic do
      total_ans_ampt { Faker::Number.number(10) }
      wrong_ans { Faker::Number.number(10) }
      correct_ans { Faker::Number.number(10) }
      score { Faker::Number.number(10) }
      accuracy { Faker::Number.number(10) }
      speed { Faker::Number.number(10) }
      time { Faker::Time.forward(days: 23, period: :all) }
    end
  end