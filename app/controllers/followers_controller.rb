class FollowersController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @follow = current_user.follows.build(following: @user)

    head :not_acceptable unless @follow.save

    update_profile
  end

  def destroy
    @user = User.find(params[:user_id])
    Follow.where(following: @user, user_id: current_user).delete_all

    update_profile
  end

  protected

    def update_profile
      respond_to do |format|
        format.js { render :update }
      end
    end
end
