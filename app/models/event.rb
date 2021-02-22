class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings

  enum host_spoon: { no_pref: 0, little: 1, mid: 2, big: 3 }

  validates :title, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :max_guest, presence: true
  validates :description, presence: true
end
