require 'rails_helper'

RSpec.describe Api::V1::AdvisorsController, type: :controller do
  let(:orientador) { FactoryBot.create(:advisor) }
  let(:body) { JSON.parse(response.body) }

  describe "GET find" do  
    it "Retornar um Orientador" do
      get :find, params: { id: orientador.id }
      response = body
      expect(response["id"]).to eq orientador["id"]
    end
  end
  
  describe "POST save" do
    it "Gravar Orientador" do  
      orientador = FactoryBot.attributes_for(:advisor)
      post :save, params: orientador
      response = body
      expect(response[:nome]).to eq orientador["name"]
    end
    
    it "Não gravar orientador com mesmo nome" do  
      post :save, params: { name: orientador[:name], area: "Rails" }
      response = body
      expect(response["id"]).to be nil
    end
  end

  describe "PUT update" do
    it "Atualizar Orientador" do
      name = "Joao Contador"
      put :update, params: { id: orientador[:id],  name: name, area: "DB"}
      response = body
      expect(response["name"]).to eq name
    end

    it "Não Atualizar caso já haja Orientador com mesmo nome" do
      put :update, params: { id: orientador[:id],  name: orientador[:name]}
      response = body
      expect(response["id"]).to be nil
    end
  end

  describe "GET index" do
    it "Retornar 10 registros" do
      20.times do |i| FactoryBot.create(:advisor, name: Faker::Name.name+i.to_s) end
      get :index
      response = body
      expect(response.size).to eq(10)
    end
  end

  describe "DELETE remove" do
    it "Remover um orientador" do
      delete :remove, params: { id: orientador[:id] }
      response = body
      expect(response["id"]).to eq orientador["id"]
    end

    it "Não Remover um orientador caso não tenha Aluno ligado a Ele" do
      aluno = FactoryBot.create(:student, advisor_id: orientador["id"])
      delete :remove, params: { id: orientador["id"] }
      res = response
      expect(res).to have_http_status(400)
    end
  end
end