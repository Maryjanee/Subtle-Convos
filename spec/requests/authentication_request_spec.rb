require 'rails_helper'

RSpec.describe "Authentications", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/authentication/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/authentication/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/authentication/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
