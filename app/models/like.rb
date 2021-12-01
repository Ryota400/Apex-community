class Like < ApplicationRecord
  belongs_to :user
  belongs_to :clip

  validates :user_id, uniqueness: { scope: :clip_id }
end
