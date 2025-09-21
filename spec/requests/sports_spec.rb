require 'rails_helper'

RSpec.describe "Sports", type: :request do
  describe "GET /sports" do
    it "returns a successful response" do
      get sports_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /sports/:id" do
    let(:sport) { Sport.create!(name: "Soccer") }

    it "returns a successful response" do
      get sport_path(sport)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Soccer")
    end
  end
end