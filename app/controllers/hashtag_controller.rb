class HashtagController < ApplicationController
  def show
    @hashtag = Hashtag.where('name ILIKE ?', params[:name]).first

    request.variant = :not_found if @hashtag.nil?
  end
end
