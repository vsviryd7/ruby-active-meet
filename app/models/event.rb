class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :sport

  validates :sport, :host, :location, :event_time, presence: true
  validates :players_needed, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
