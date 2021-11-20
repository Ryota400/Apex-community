class VideosController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to videos_path, success: t('defaults.message.created', item: Video.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Video.model_name.human)
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = current_user.videos.find(params[:id])
  end

  def update
    @video = current_user.videos.find(params[:id])
    if @video.update(video_params)
      redirect_to @video, success: t('defaults.message.updated', item: Video.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Video.model_name.human)
      render :edit
    end
  end

  def destroy
    @video = current_user.videos.find(params[:id])
    @video.destroy!
    redirect_to videos_path, success: t('defaults.message.deleted', item: Video.model_name.human)
  end

  private

  def video_params
    params.require(:video).permit(:title, :video)
  end
end
