# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Sport.create!(name: "Soccer", description: "Team sport played with a round ball")
Sport.create!(name: "Basketball", description: "Team sport played with hoops")
Sport.create!(name: "Tennis", description: "Racket sport played one-on-one or doubles")

User.find_or_create_by!(email: "alice@example.com") { |u| u.name="Alice"; u.password="password123"; u.role=:member }
User.find_or_create_by!(email: "bob@example.com")   { |u| u.name="Bob";   u.password="password123"; u.role=:organizer }