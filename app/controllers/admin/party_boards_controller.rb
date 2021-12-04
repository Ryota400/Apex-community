class Admin::PartyBoardsController < Admin::BaseController
  before_action :set_party_board, only: %i[edit update show destroy]

  def index
    @q = PartyBoard.ransack(params[:q])
    @party_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @party_board.update(party_board_params)
      redirect_to admin_party_board_path(@party_board), success: t('defaults.message.updated', item: PartyBoard.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: PartyBoard.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @party_board.destroy!
    redirect_to admin_party_boards_path, success: t('defaults.message.deleted', item: PartyBoard.model_name.human)
  end

  private

  def set_party_board
    @party_board = PartyBoard.find(params[:id])
  end

  def party_board_params
    params.require(:party_board).permit(:title, :body, :recruit)
  end
end
