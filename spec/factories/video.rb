FactoryBot.define do
    factory :video do
      video_nm { Faker::Lorem.word }
      video_link { Faker::Lorem.word}
      video_len { Faker::Number.digit}
      video_logo { Faker::Lorem.word } 
      watched_status { Faker::Boolean.boolean(true_ratio: 1.0) }
      time_watched { Faker::Time.forward(days: 23, period: :all) }
      notes {Faker::Lorem.word}
      like { Faker::Boolean.boolean(true_ratio: 1.0) }
      dislike { Faker::Boolean.boolean(true_ratio: 1.0) }
    end
end