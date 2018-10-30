require 'rails_helper'

RSpec.describe Api::V1::StudentsController, type: :controller do
    let(:orientador) { FactoryBot.create(:advisor) }
    let(:estudante) { FactoryBot.create(:student, advisor_id: orientador[:id]) }
    let(:body) { JSON.parse(response.body) }
    
    describe "GET find" do
        it "Retorna unico Estudante" do
            get :find, params: { id: estudante }
            response = body
            expect(response["id"]).to eq estudante["id"] 
        end
    end
    
    describe "POST save" do
        it "Gravar Estudante" do
            estudante = FactoryBot.attributes_for(:student, advisor_id: orientador[:id])
            post :save, params: estudante
            response = body
            # binding.pry
            expect(response["nome"]).to eq estudante[:nome]
            expect(response["advisor_id"]).to eq estudante[:advisor_id]
        end
    end

    describe "PUT update" do
        it "Atualizar Estudante" do
            estudante_update = { id: estudante[:id], advisor_id: orientador[:id],  name: "Clarice"}
            put :update, params: estudante_update
            response = body
            # binding.pry
            expect(response[:name]).to eq estudante_update["name"] 
            expect(response[:advisor_id]).to eq estudante_update["advisor_id"]
        end
    end

    describe "GET index" do
        it "Retornar 10 itens" do
            20.times { FactoryBot.create(:student, name: Faker::Name.unique.name, advisor_id: orientador[:id]) }
            get :mostrar
            response = body
            expect(response.size).to eq(10)
        end
    end

    describe "POST exibe_dados_completos" do
        it "Exibe dados completo" do
            FactoryBot.create(:student, advisor_id: orientador[:id])
            post :exibe_dados_completos
            response = body
            expect(response[0]["orientador"]["id"]).to eq orientador[:id]
        end
    end

    describe "DELETE remove" do
        it "Remover um Estudante" do
            delete :remove, params: { id: estudante[:id] }
            response = body
            expect(response["id"]).to eq estudante["id"] 
        end
    end
end