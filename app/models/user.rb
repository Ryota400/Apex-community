class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :party_boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_party_boards, through: :bookmarks, source: :party_board

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }

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
end
