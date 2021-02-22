class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :max_guest, presence: true, default: 1
  validates :description, presence: true


end
