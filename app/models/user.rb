class User < ApplicationRecord
  has_many :bookings
  has_many :events, through: :bookings
  has_many :events_as_host, class_name: 'Event'
  has_one_attached :photo
  has_many :reviews_from_guests, class_name: 'Review', foreign_key: :reviewee_id
  has_many :reviews_as_a_guest, class_name: 'Review', foreign_key: :reviewer_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
