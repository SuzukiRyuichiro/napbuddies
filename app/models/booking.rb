class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { pending: 0, approved: 1, declined: 2 }
  enum spoon: { no_pref: 0, little: 1, mid: 2, big: 3 }
end
