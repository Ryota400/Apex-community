class Clip < ApplicationRecord
  mount_uploader :movie, MovieUploader
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
end
