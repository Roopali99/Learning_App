FactoryBot.define do
  factory :standard do
    class_id { Faker::Number.number(digits: 10) }
    board_id {}
  end 
end