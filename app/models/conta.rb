class Conta < ApplicationRecord
    validates :codigo, uniqueness: true
end