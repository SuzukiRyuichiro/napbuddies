class Review < ApplicationRecord
  belongs_to :user
  # belongs_to :reviewed, class_name: "User", foreign_key: :user_id
end
