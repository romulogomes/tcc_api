require 'rails_helper'

RSpec.describe Api::V1::ContasController, type: :controller do
    let(:conta) { FactoryBot.create(:conta) }
    let(:body) { JSON.parse(response.body) }
    
    describe "GET find" do  
      it "Retorna unica Conta" do
          get :find, params: { id: conta[:id] }
          response = body
          expect(response["id"]).to eq conta["id"] 
      end
    end

    describe "POST save" do
      it "Gravar Conta" do
          conta = FactoryBot.attributes_for(:conta)
          post :save, params: conta
          response = body
          expect(response["natureza"]).to eq conta[:natureza]
          expect(response["codigo"]).to eq conta[:codigo]
      end

      it "Não gravar conta com o mesmo codigo" do
        conta = FactoryBot.create(:conta)
        post :save, params: FactoryBot.attributes_for(:conta, codigo: conta[:codigo])
        response = body
        expect(response["id"]).to be nil
      end
    end

    describe "PUT update" do
      it "Atualizar Conta" do
        nova_conta = FactoryBot.create(:conta)
        codigo = "1.1.1"
        put :update, params: { id: nova_conta[:id],  codigo: codigo}
        response = body
        expect(response["codigo"]).to eq codigo
      end
  
      it "Não Atualizar caso já exista uma conta com mesmo código" do
        nova_conta = FactoryBot.create(:conta, codigo: "1.2")
        put :update, params: { id: nova_conta[:id],  codigo: conta[:codigo]}
        res = response 
        expect(res).to have_http_status(400)
      end
    end

    describe "DELETE remove" do
      it "Remover uma Conta" do
        delete :remove, params: { id: conta[:id] }
        response = body
        expect(response["id"]).to eq conta["id"]
      end
  
      it "Não Remover uma Conta caso tenha Lançamento ligado a ela" do
        conta_credora = FactoryBot.create(:conta, :natureza_credora, codigo: "2.1");
        lancamento = FactoryBot.create(:lancamento, conta_credito: conta_credora["id"], conta_debito: conta[:id])
        delete :remove, params: { id: conta_credora["id"] }
        res = response 
        expect(res).to have_http_status(400)
      end
    end
end