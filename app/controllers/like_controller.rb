class LikeController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)

    head :not_acceptable unless @like.save
  end

  def destroy
    @like = current_user.likes.find_by(like_params)

    head :not_acceptable unless @like&.destroy
  end

  protected

    def like_params
      params.permit(:post_id)
    end
end
