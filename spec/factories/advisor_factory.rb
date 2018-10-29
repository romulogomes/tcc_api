# FactoryBot.define do
#   factory :advisor, class: Advisor 
# end

FactoryBot.define do
  factory :advisor do
    name Faker::Name.name
    area Faker::Name.name
  end
end