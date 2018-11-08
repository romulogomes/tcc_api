require 'rails_helper'

RSpec.describe Api::V1::LancamentosController, type: :controller do
    let(:conta_credito) { FactoryBot.create(:conta, :natureza_credora) }
    let(:conta_debito) { FactoryBot.create(:conta) }
    let(:lancamento) { FactoryBot.create(:lancamento, conta_credito: conta_credito[:id], conta_debito: conta_debito[:id]) }
    let(:body) { JSON.parse(response.body) }

    describe "GET find" do  
        it "Retornar um Lancamento" do
            get :find, params: { id: lancamento[:id] }
            response = body
            expect(response["id"]).to eq lancamento["id"] 
        end
    end

    describe "POST save" do
        it "Gravar Lançamento" do
            lancamento = FactoryBot.attributes_for(:lancamento)
            lancamento[:conta_credito] = conta_credito[:id]
            lancamento[:conta_debito] = conta_debito[:id]
            post :save, params: lancamento
            response = body
            expect(response["conta_credito"]).to eq lancamento[:conta_credito]
            expect(response["conta_debito"]).to eq lancamento[:conta_debito]
            expect(response["historico"]).to eq lancamento[:historico]
        end

        it "Não gravar lançamento sem conta"
        end
    end

    describe "GET index" do
        it "Retornar todos os Lançamentos" do
            15.times { FactoryBot.create(:lancamento, conta_credito: conta_credito[:id], conta_debito: conta_debito[:id]) }
            get :index
            response = body
            expect(response.size).to eq(15)
        end
    end

    describe "PUT update" do
        it "Atualizar Lançamento" do
            lancamento = FactoryBot.create(:lancamento, conta_credito: conta_credito[:id], conta_debito: conta_debito[:id])
            lancamento_update = { id: lancamento[:id], conta_credito: conta_debito[:id],  conta_debito: conta_credito[:id] }
            put :update, params: lancamento_update
            response = body
            expect(response[:conta_credito]).to eq lancamento_update["conta_credito"] 
            expect(response[:conta_debito]).to eq lancamento_update["conta_debito"]
        end
    end

    describe "DELETE remove" do
        it "Remover um Estudante" do
            lancamento = FactoryBot.create(:lancamento, conta_credito: conta_credito[:id], conta_debito: conta_debito[:id])
            delete :remove, params: { id: lancamento[:id] }
            response = body
            expect(response["id"]).to eq lancamento["id"] 
        end
    end
end
