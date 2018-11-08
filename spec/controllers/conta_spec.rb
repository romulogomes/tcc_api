require 'rails_helper'

RSpec.describe Api::V1::ContasController, type: :controller do
    let(:conta) { FactoryBot.create(:conta) }
    let(:body) { JSON.parse(response.body) }
    
    describe "GET find" do  
      it "Retorna unica Conta" do
          get :find, params: { id: conta[:id] }
          response = body
          # binding.pry
          expect(response["id"]).to eq conta["id"] 
      end
    end

    describe "POST save" do
      it "Gravar Conta" do
          conta = FactoryBot.attributes_for(:conta)
          post :save, params: conta
          response = body
          # binding.pry
          expect(response["natureza"]).to eq conta[:natureza]
          expect(response["codigo"]).to eq conta[:codigo]
      end

      it "Não gravar Conta com o mesmo codigo" do
        conta = FactoryBot.create(:conta)
        post :save, params: FactoryBot.attributes_for(:conta, codigo: conta[:codigo])
        response = body
        expect(response["id"]).to be nil
      end
    end
end