class Clip < ApplicationRecord
  mount_uploader :movie, MovieUploader
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
end
