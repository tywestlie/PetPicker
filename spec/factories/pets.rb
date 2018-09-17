FactoryBot.define do
  factory :pet do
    name {Faker::Name.unique.first_name}
    species { [0,1,2].sample }
    description { "Poops a lot" }
    pic { "https://cdn2-www.dogtime.com/assets/uploads/2011/03/puppy-development-460x306.jpg" }
    age { [1,2,3,4,5].sample }
    weight { [0,1,2].sample }
  end
end
