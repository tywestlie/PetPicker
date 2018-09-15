FactoryBot.define do
  factory :user do
    name { Faker::Simpsons.unique.character }
    password { Faker::Crypto.sha256 }
  end
end
