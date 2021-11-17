class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  validates :title, presence: true, length: { maximum: 255 }
end
