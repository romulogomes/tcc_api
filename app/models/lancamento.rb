class Lancamento < ApplicationRecord
    belongs_to :contas_credito, class_name: "Conta", foreign_key: "conta_credito"
    belongs_to :contas_debito, class_name: "Conta", foreign_key: "conta_debito"
end
