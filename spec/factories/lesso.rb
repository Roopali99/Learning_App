FactoryBot.define do
    factory :lesso do
      chapter_nm { Faker::Lorem.word }
      video_count { Faker::Number.digit}
      pdf_count { Faker::Number.digit}
    end
end