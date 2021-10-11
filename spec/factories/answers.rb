# spec/factories/todos.rb
FactoryBot.define do
    factory :answer do
      solution { Faker::Lorem.word }
    end
  end