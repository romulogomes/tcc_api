FactoryBot.define do
    factory :lancamento do
        valor 10.50
        historico { Faker::Lorem.sentence }
        association :conta_credito, factory: :conta
    end
end