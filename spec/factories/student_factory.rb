# FactoryBot.define do
#     factory :student, class: Student
#   end

FactoryBot.define do
  factory :student do
    name { Faker::Name.unique.name }
    association :advisor, factory: :advisor
  end
end