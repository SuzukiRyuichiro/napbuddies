class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :max_guest, presence: true
  validates :description, presence: true

  enum host_spoon: { "No preference" => 0, "Little Spoon" => 1, "Middle Spoon" => 2,  "Big Spoon" => 3 }
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description, :host_spoon, :location ],
    associated_against: {
      user: :username
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
