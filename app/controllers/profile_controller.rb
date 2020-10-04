class ProfileController < ApplicationController
  def show
    @user = User.where('nickname ILIKE ?', params[:nickname]).first
  end
end
