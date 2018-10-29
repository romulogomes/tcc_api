require 'rails_helper'

RSpec.describe Api::V1::StudentsController, type: :controller do
    let(:orientador) { FactoryBot.create(:advisor) }
    let(:estudante) { FactoryBot.create(:student, advisor_id: orientador[:id]) }
    let(:body) { JSON.parse(response.body) }
    
    describe "GET index" do
        it "Retornar 200" do
            20.times { FactoryBot.create(:student, name: Faker::Name.name, advisor_id: orientador[:id])}
            get :mostrar
            response = body
            expect(response.size).to eq(10)
        end
    end

    describe "GET find" do
        it "Retorna unico Estudante" do
            get :find, params: { id: estudante }
            response = body
            expect(response["id"]).to eq estudante["id"] 
        end
    end
    
    describe "POST save" do
        it "Gravar Estudante" do
            estudante = { name: "Acer Ven", advisor_id: orientador[:id]}
            post :save, params: estudante
            response = body
            expect(response[:nome]).to eq estudante[:nome]
        end
    end

    describe "PUT update" do
        it "Atualizar Estudante" do
        new_estudante = { id: estudante[:id], advisor_id: orientador[:id],  name: "Clarice"}
        put :update, params: new_estudante
        response = body
        expect(response[:name]).to eq new_estudante["name"] 
        expect(response[:advisor_id]).to eq new_estudante["advisor_id"]
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