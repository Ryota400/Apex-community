class ClipsController < ApplicationController
  before_action :set_clip, only: %i[edit update destroy]
  def index
    @q = Clip.ransack(params[:q])
    @clips = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @clip = Clip.new
  end

  def create
    @clip = current_user.clips.build(clip_params)
    if @clip.save
      redirect_to clips_path, success: t('defaults.message.created', item: Clip.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Clip.model_name.human)
      render :new
    end
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def edit
    @clip = current_user.clips.find(params[:id])
  end

  def update
    @clip = current_user.clips.find(params[:id])
    if @clip.update(clip_params)
      redirect_to @clip, success: t('defaults.message.updated', item: Clip.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Clip.model_name.human)
      render :edit
    end
  end

  def destroy
    @clip = current_user.clips.find(params[:id])
    @clip.destroy!
    redirect_to clips_path, success: t('defaults.message.deleted', item: Clip.model_name.human)
  end

  private

  def find_clip
    @clip = current_user.clips.find(params[:id])
  end

  def set_clip
    @clip = current_user.clips.find(params[:id])
  end

  def clip_params
    params.require(:clip).permit(:title, :movie, :movie_cache)
  end
end
