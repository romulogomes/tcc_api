FactoryBot.define do
    factory :conta do
        natureza { 'D' }
        codigo { "1.1" }
        descricao { Faker::Company.name }
        classificacao { "Ativo" }

        trait :natureza_credora do
            natureza { 'C' }
            codigo { "2.1" }
        end
    end
end