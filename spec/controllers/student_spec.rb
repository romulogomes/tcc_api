require 'rails_helper'

RSpec.describe Api::V1::StudentsController, type: :controller do
    
    # describe "GET index" do
    #     it "Retornar 200" do
    #     get :mostrar
    #     expect(response).to have_http_status(:success)
    #     end
    # end

    # describe "DELETE remove" do
    #     it "Remover um Estudante" do
    #     aluno_id = randomAluno().id
    #     delete :remove, params: { id: aluno_id }
    #     aluno = JSON.parse(response.body)
    #     expect(aluno_id).to eq aluno["id"] 
    #     end
    # end

    # describe "POST save" do
    #     it "Gravar Aluno" do
    #     new_aluno = fabricaAluno()
    #     post :save, params: new_aluno
    #     aluno = JSON.parse(response.body)
    #     expect(new_aluno[:name]).to eq aluno["name"]
    #     end
    # end

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

    private 
    def fabricaAluno()
        return { name: Faker::Name.name, advisor_id: randomOrientador().id }
    end

    private 
    def randomAluno()
        return Student.order("RANDOM()").first
    end

    def randomOrientador()
        return Advisor.order("RANDOM()").first
    end
end