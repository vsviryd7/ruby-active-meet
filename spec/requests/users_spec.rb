require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns a successful response" do
      get users_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /users/:id" do
    let(:sport) { Sport.create!(name: "Basketball") }
    let(:user) do
      User.create!(
        name: "Olga",
        email: "olga@example.com",
        password: "password123",
        password_confirmation: "password123",
        favorite_sport: sport
      )
    end
  end
end