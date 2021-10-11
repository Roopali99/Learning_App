FactoryBot.define do
    factory :student_solution do
        ques_status { Faker::Boolean.boolean(true_ratio: 1.0)}
        option_selected { Faker::Lorem.word}
        status { Faker::Boolean.boolean(true_ratio: 1.0)}
        marked_later { Faker::Boolean.boolean(true_ratio: 1.0)}
        skip { Faker::Boolean.boolean(true_ratio: 1.0)}
        time_taken { Faker::Time.forward(days: 23, period: :all) }
    end
end