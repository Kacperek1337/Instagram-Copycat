class CommentsController < ApplicationController
  def index
    @comments = Comment.where(params.permit(:post_id))
  end

  def create
    @comment = current_user.comments.build(params.permit(:post_id, :content))

    return head :not_acceptable unless @comment.save

    redirect_to post_url(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])

    head :not_acceptable unless @comment.destroy
  end
end
