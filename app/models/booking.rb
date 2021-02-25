class BookingValidator < ActiveModel::Validator
  def validate(record)
    if record.event.user == record.user
      record.errors[:user] << "Host cannot book his or her own event"
    end
  end
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { pending: 0, approved: 1, declined: 2 }
  enum spoon: { no_pref: 0, little: 1, mid: 2, big: 3 }

  validates_with BookingValidator
end
