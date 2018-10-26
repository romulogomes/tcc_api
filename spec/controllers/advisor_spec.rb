require 'rails_helper'

RSpec.describe Api::V1::AdvisorsController, type: :controller do
  let(:body) { JSON.parse(response.body) }

  describe "POST save" do
    let(:advisor) { FactoryBot.attributes_for(:advisor) }
    it "Gravar Orientador" do  
      post :save, params: advisor
      orientador = body
      expect(orientador[:nome]).to eq advisor["name"]
    end 

    
    it "Gravar Orientador" do  
      # post :save, params: advisor
      # orientador = JSON.parse(response.body)
      # expect("got").to eq advisor
    end 
  end

  # describe "DELETE remove" do
  #   it "Remover um orientador caso não tenha Aluno ligado a Ele" do
  #     orientador_id = randomOrientador().id
  #     statusEsperado = Student.where("advisor_id = "+orientador_id.to_s).exists? ? 400 : 200
  #     delete :remove, params: { id: orientador_id }
  #     orientador = JSON.parse(response.body)
  #     expect(response.status).to eq statusEsperado
  #   end
  # end

  # describe "POST save" do
  #   it "Gravar Orientador" do
  #     # orientador = FactoryBot.build(:admin)

  #     new_orientador = fabricaOrientador();
  #     expect { post :save, params: new_orientador }.to change { Advisor.count }.from(4).to(5)
  #     orientador = JSON.parse(response.body)

  #     expect("GOT").to eq orientador[:name]
  #   end
  # end

  # describe "GET find" do
  #   it "should be return a correct value of Orientador" do
  #     orientador_id = randomOrientador().id
  #     get :find, params: { id: orientador_id }
  #     orientador = JSON.parse(response.body)
  #     expect(orientador_id).to eq orientador["id"]
  #   end
  # end

  # describe "PUT update" do
  #   it "Atualizar a correct value of Orientador" do
  #     orientador_id = randomOrientador().id
  #     new_orientador = fabricaOrientador();
  #     put :update, params: { id: orientador_id}.merge(new_orientador)
  #     orientador = JSON.parse(response.body)
  #     expect(new_orientador[:name]).to eq orientador["name"] 
  #     expect(new_orientador[:area]).to eq orientador["area"] 
  #   end
  # end

  # private 
  # def fabricaOrientador()
  #     return { name: "AAA", area: Faker::Science.element }
  # end


end