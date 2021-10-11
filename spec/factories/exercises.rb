# spec/factories/todos.rb
FactoryBot.define do
    factory :exercise do
        ex_no { Faker::Number.number }
        ex_status {Faker::Boolean.boolean(true_ratio: 1.0) }
        num_of_ques { Faker::Number.number(10)}
        total_time { Faker::Time.forward(days: 23, period: :all) }
        start_time { Faker::Time.forward(days: 23, period: :all)}
        end_time { Faker::Time.forward(days: 23, period: :all) }
    end
end