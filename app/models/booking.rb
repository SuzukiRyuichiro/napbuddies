class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { pending: 0, approved: 1, declined: 2 }
  enum role: { big_spoon: 0, little_spoon: 1 }
end
