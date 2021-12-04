class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :party_boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_party_boards, through: :bookmarks, source: :party_board

  has_many :videos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_videos, through: :favorites, source: :video

  has_many :clips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_clips, through: :likes, source: :clip

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :user_name, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end

  def bookmark(party_board)
    bookmark_party_boards << party_board
  end

  def unbookmark(party_board)
    bookmark_party_boards.destroy(party_board)
  end

  def bookmark?(party_board)
    bookmark_party_boards.include?(party_board)
  end


  def favorite(video)
    favorite_videos << video
  end

  def unfavorite(video)
    favorite_videos.destroy(video)
  end

  def favorite?(video)
    favorite_videos.include?(video)
  end


  def like(clip)
    like_clips << clip
  end

  def unlike(clip)
    like_clips.destroy(clip)
  end

  def like?(clip)
    like_clips.include?(clip)
  end

end
