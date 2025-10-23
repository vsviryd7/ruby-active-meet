class User < ApplicationRecord
  has_secure_password  # needs bcrypt + password_digest

  enum :role, { member: 0, organizer: 1, admin: 2 }

  has_many :events, foreign_key: :host_id, dependent: :destroy
  belongs_to :favorite_sport, class_name: "Sport", optional: true

  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
