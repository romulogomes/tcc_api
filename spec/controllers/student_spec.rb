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

    describe "DELETE remove" do
        it "Remover um Estudante" do
            delete :remove, params: { id: estudante[:id] }
            response = body
            expect(response["id"]).to eq estudante["id"] 
        end
    end

    describe "POST save" do
        it "Gravar Aluno" do
            aluno = { name: "Acer Ven", advisor_id: orientador[:id]}
            post :save, params: aluno
            response = body
            expect(response[:nome]).to eq aluno[:nome]
        end
    end

    # describe "GET find" do
    #     it "Retorna unico aluno" do
    #     aluno_id = randomAluno().id
    #     get :find, params: { id: aluno_id }
    #     aluno = JSON.parse(response.body)
    #     expect(aluno_id).to eq aluno["id"] 
    #     end
    # end

    # describe "PUT update" do
    #     it "Atualizar a correct value do Aluno" do
    #     aluno_id = randomAluno().id
    #     new_aluno = fabricaAluno()
    #     put :update, params: { id: aluno_id}.merge(new_aluno)
    #     aluno = JSON.parse(response.body)
    #     expect(new_aluno[:name]).to eq aluno["name"] 
    #     expect(new_aluno[:advisor_id]).to eq aluno["advisor_id"]
    #     end
    # end
end