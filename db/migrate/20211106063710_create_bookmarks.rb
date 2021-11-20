class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :party_board, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, %i[user_id party_board_id], unique: true
  end
end
