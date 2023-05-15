require 'rails_helper'

RSpec.describe "Signins", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/signin/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destory" do
    it "returns http success" do
      get "/signin/destory"
      expect(response).to have_http_status(:success)
    end
  end

end
