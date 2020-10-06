class ProfileController < ApplicationController
  def show
    @user = User.where('nickname ILIKE ?', params[:nickname]).first

    request.variant = :not_found if @user.nil?
  end
end
