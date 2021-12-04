class Admin::ClipsController < Admin::BaseController
  before_action :set_clip, only: %i[edit update show destroy]

  def index
    @q = Clip.ransack(params[:q])
    @clips = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @clip.update(clip_params)
      redirect_to admin_clip_path(@clip), success: t('defaults.message.updated', item: Clip.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Clip.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @clip.destroy!
    redirect_to admin_clips_path, success: t('defaults.message.deleted', item: Clip.model_name.human)
  end

  private

  def set_clip
    @clip = Clip.find(params[:id])
  end

  def clip_params
    params.require(:clip).permit(:title, :movie, :movie_cache)
  end
end
