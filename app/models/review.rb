class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validates :rating, inclusion: { in: (0..5).to_a, message: "Rating has to be between 0 to 5" }
  validates :content, presence: true
end
