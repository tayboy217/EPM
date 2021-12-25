FactoryBot.define do
  factory :note do
    word { Faker::Lorem }
    english { Faker::Lorem }
    japanese { Faker::Lorem }
  end
end