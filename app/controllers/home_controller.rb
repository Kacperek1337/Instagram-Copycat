class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    return request.variant = :not_found unless user_signed_in?

    @posts = []
    current_user.following.each do |fl|
      @posts.concat fl.posts
    end
    @posts.sort_by!(&:created_at).reverse!
  end
end
