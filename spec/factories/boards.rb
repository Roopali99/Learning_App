FactoryBot.define do
  factory :board do
    board_nm { Faker::Lorem.word }
    board_description { Faker::Lorem.word }
    board_logo { Faker::Lorem.word }
  end
  # factory :access_token, class: 'Doorkeeper::AccessToken' do
  #   expires_in { 2.hours }
  #   scopes { 'boards' }
  # end
end 