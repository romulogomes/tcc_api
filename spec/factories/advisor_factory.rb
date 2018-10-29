# FactoryBot.define do
#   factory :advisor, class: Advisor 
# end

FactoryBot.define do
  factory :advisor do
    name { Faker::Name.unique.name }
    area { Faker::Lorem.word }
  end
end