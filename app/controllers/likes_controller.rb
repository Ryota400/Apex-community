class LikesController < ApplicationController
  def create
    @clip = Clip.find(params[:clip_id])
    current_user.like(@clip)
  end

  def destroy
    @clip = current_user.likes.find(params[:id]).clip
    current_user.unlike(@clip)
  end
end
