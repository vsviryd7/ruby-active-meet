class User < ApplicationRecord
   # A user can host many events
  has_many :events, foreign_key: :host_id, dependent: :destroy
  belongs_to :favorite_sport, class_name: "Sport"
end
