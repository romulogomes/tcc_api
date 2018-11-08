FactoryBot.define do
    factory :lancamento do
        valor { 10.50 }
        historico { Faker::Lorem.sentence }
        # conta_credito { FactoryBot.create(:conta, lancamcodigo: "1"+Faker::Number.decimal(0,2)) }

        association :conta_credito, factory: :conta
        association :conta_debito, factory: :conta
    end
end