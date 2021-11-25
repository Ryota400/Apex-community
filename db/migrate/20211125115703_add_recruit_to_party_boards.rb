class AddRecruitToPartyBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :party_boards, :recruit, :string
  end
end
