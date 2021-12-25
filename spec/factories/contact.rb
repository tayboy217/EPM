FactoryBot.define do
  factory :contact do
    title { Faker::Lorem }
    body { Faker::Lorem }
  end
end