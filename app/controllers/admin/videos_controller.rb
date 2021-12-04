class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: %i[edit update show destroy]

  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @video.update(video_params)
      redirect_to admin_video_path(@video), success: t('defaults.message.updated', item: Video.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Video.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @video.destroy!
    redirect_to admin_videos_path, success: t('defaults.message.deleted', item: Video.model_name.human)
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :best_movie, :best_movie_cache)
  end

end
