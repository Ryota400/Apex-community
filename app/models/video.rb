class Video < ApplicationRecord
  mount_uploader :best_movie, BestMovieUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
end
