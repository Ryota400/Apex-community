class BookmarksController < ApplicationController
  def create
    @party_board = PartyBoard.find(params[:party_board_id])
    current_user.bookmark(@party_board)
  end

  def destroy
    @party_board = current_user.bookmarks.find(params[:id]).party_board
    current_user.unbookmark(@party_board)
  end
end
