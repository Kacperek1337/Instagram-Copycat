class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    return request.variant = :not_found unless user_signed_in?

    page = params[:page].to_i
    page = 1 if page < 1

    @posts = Post.find_by_sql([%(
      SELECT *
      FROM posts
      WHERE user_id IN (
        SELECT following_id
        FROM follows
        WHERE user_id = ?
      )
      ORDER BY created_at DESC
      LIMIT ?
      OFFSET ?
    ), current_user.id, 10, (page - 1) * 10])
  end
end
