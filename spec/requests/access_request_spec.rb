require 'rails_helper'

RSpec.describe "Accesses", type: :request do

  describe "GET /menu" do
    it "returns http success" do
      get "/access/menu"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /login" do
    it "returns http success" do
      get "/access/login"
      expect(response).to have_http_status(:success)
    end
  end

end
