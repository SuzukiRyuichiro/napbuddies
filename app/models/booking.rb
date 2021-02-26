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
  enum host_spoon: { "No preference" => 0, "Little Spoon" => 1, "Middle Spoon" => 2,  "Big Spoon" => 3 }


  validates_with BookingValidator
end
