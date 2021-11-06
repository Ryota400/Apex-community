class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :party_board

  validates :body, presence: true, length: { maximum: 65_535 }
end
