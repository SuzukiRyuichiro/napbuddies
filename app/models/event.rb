class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true, :location, presence: true
  validates :time, presence: true, :max_guest, presence: true
  validates :description, presence: true
end
