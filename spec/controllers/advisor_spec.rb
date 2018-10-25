require 'rails_helper'

RSpec.describe Api::V1::AdvisorsController, type: :controller do
  describe "GET index" do
    it "Retornar 200" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE remove" do
    it "Remover um orientador caso não tenha Aluno ligado a Ele" do
      orientador_id = randomOrientador().id
      statusEsperado = Student.where("advisor_id = "+orientador_id.to_s).exists? ? 400 : 200
      delete :remove, params: { id: orientador_id }
      orientador = JSON.parse(response.body)
      expect(response.status).to eq statusEsperado
    end
  end

  describe "POST save" do
    it "Gravar Orientador" do
      orientador = fabricaOrientador();
      post :save, params: { name: orientador[:name], area: orientador[:area] }
      retorno = JSON.parse(response.body)
      expect(orientador[:name]).to eq retorno["name"]
    end
  end

  describe "GET find" do
    it "should be return a correct value of Orientador" do
      orientador_id = randomOrientador().id
      get :find, params: { id: orientador_id }
      orientador = JSON.parse(response.body)
      expect(orientador_id).to eq orientador["id"]
    end
  end

  describe "PUT update" do
    it "Atualizar a correct value of Orientador" do
      orientador_id = randomOrientador().id
      orientador = fabricaOrientador();
      put :update, params: { id: orientador_id}.merge(orientador)
      retorno = JSON.parse(response.body)
      expect(orientador[:name]).to eq retorno["name"] 
      expect(orientador[:area]).to eq retorno["area"] 
    end
  end

  private 
  def fabricaOrientador()
      return { name: Faker::Name.name, area: Faker::Science.element }
  end

  def randomOrientador()
      return Advisor.order("RANDOM()").first
  end

end