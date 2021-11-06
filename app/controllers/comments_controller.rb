class CommentsController < ApplicationController
    def create
        comment = current_user.comments.build(comment_params)
        if comment.save
            redirect_to party_board_path(comment.party_board), success: t('defaults.message.created', item: Comment.model_name.human)
        else
            redirect_to party_board(comment.party_board), danger: t('defaults.message.not_created', item: Comment.model_name.human)
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(party_board_id: params[:party_board_id])
    end
end
