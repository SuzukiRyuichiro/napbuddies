class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :reviewed, class_name: "User", foreign_key: :user_id

  validates :rating, inclusion: { in: (0..5).to_a, message: "Rating has to be between 0 to 5" }
end
