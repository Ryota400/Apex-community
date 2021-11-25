class Video < ApplicationRecord
  mount_uploader :best_movie, BestMovieUploader
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
end
