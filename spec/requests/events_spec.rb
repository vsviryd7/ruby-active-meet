require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "returns a successful response" do
      get events_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /events/:id" do
    let(:sport) { Sport.create!(name: "Soccer") }
    let(:user)  { User.create!(name: "Alice", email: "alice@example.com", favorite_sport: sport) }
    let(:event) do 
      Event.create!(
        location: "Central Park",
        event_time: Time.now,
        players_needed: 10,
        description: "Pickup game",
        sport: sport,
        host: user
  )
    end
  end
end