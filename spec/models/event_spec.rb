require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:sport) { Sport.create!(name: "Voleyball") }
  let(:user) { User.create!(
    name: "Masha",
    email: "masha@example.com",
    encrypted_password: "password123",
    favorite_sport: sport
  )}
  describe "validations" do
    it "is valid with a host and sport" do
      event = Event.new(
        host: user,
        sport: sport,
        location: "Charlotte Park",
        event_time: Time.current + 2.days,
        players_needed: 10,
        description: "Women match"
      )

      expect(event).to be_valid
    end
  end
end