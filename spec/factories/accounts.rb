FactoryBot.define do
    factory :account do
      email { Faker::Lorem.word }
      student_name { Faker::Lorem.word }
      mobile { Faker::PhoneNumber.cell_phone }
      dob { Faker::Date.birthday(min_age: 03, max_age: 65) }
      otp { Faker::Number.number }
    end
    factory :access_token, class: 'Doorkeeper::AccessToken' do
      expires_in { 2.hours }
      scopes { 'public' }
    end
  end