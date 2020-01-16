# -*- encoding : utf-8 -*-
RSpec.describe Api::V1::AuthorsController, type: :controller do

  let(:valid_attributes) {
    {
      number_of_names: "3",
      list_of_names: '["Joao Gabriel", "Felipe da Silva", "Maria Goncalves"]'
    }
  }

  let(:invalid_attributes) {
    {
      number_of_names: "1",
      list_of_names: '["Joao Gabriel", "Felipe da Silva", "Maria Goncalves"]'
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: valid_attributes, session: valid_session
      expect(response).to be_successful
    end

    it "Deve retornar um json formatado" do
      get :index, params: valid_attributes, session: valid_session
      formated_response_body = JSON.parse(response.body)
      expect(formated_response_body).to eq(
        [
          "GABRIEL, Joao",
          "SILVA, Felipe da",
          "GONCALVES, Maria"
        ]
      )
    end
  end
end
