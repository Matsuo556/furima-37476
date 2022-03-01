FactoryBot.define do
  factory :purchase_record_address do

    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.city.kanji }
    address { '1-1-1' }
    building { '高い建物' }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    association :user
    association :item
  end
end
