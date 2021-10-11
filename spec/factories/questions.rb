# spec/factories/todos.rb
FactoryBot.define do
    factory :question do
        ques_no { Faker::Number.number }
        ques { Faker::Lorem.word}
        option1 { Faker::Lorem.word}
        option2 { Faker::Lorem.word }
        option3 { Faker::Lorem.word }
        option4 { Faker::Lorem.word }
        time {Faker::Time.forward(days: 23, period: :all)}
    end
end