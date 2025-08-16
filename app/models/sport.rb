class Sport < ApplicationRecord
  # Many users can pick this sport as their favorite
  has_many :users, foreign_key: "favorite_sport_id", dependent: :nullify
  # Many events can be created for this sport
  has_many :events, dependent: :destroy
end
