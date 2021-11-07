class CommentsController < ApplicationController
   def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
   end

   def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
   end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(party_board_id: params[:party_board_id])
    end
end
