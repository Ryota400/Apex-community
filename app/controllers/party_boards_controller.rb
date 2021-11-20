class PartyBoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]
  def index
    @q = PartyBoard.ransack(params[:q])
    @party_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @party_board = PartyBoard.new
  end

  def create
    @party_board = current_user.party_boards.build(party_board_params)
    if @party_board.save
      redirect_to party_boards_path, success: t('defaults.message.created', item: PartyBoard.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: PartyBoard.model_name.human)
      render :new
    end
  end

  def show
    @party_board = PartyBoard.find(params[:id])
    @comment = Comment.new
    @comments = @party_board.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @party_board = current_user.party_boards.find(params[:id])
  end

  def update
    @party_board = current_user.party_boards.find(params[:id])
    if @party_board.update(party_board_params)
      redirect_to @party_board, success: t('defaults.message.updated', item: PartyBoard.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: PartyBoard.model_name.human)
      render :edit
    end
  end

  def destroy
    @party_board = current_user.party_boards.find(params[:id])
    @party_board.destroy!
    redirect_to party_boards_path, success: t('defaults.message.deleted', item: PartyBoard.model_name.human)
  end

  def bookmarks
    @q = current_user.bookmark_party_boards.ransack(params[:q])
    @bookmark_party_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def party_board_params
    params.require(:party_board).permit(:title, :body)
  end
end
