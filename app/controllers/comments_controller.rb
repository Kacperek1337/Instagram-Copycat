class CommentsController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page < 1

    @comments = Post.find(params[:post_id])&.comments&.offset(10 * (page - 1))&.limit(page * 10)
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
