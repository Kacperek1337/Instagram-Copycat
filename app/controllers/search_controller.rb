class SearchController < ApplicationController
  def show
    @query = params[:query].to_s.gsub '#', ''
    @hashtags = Hashtag.where('name ILIKE ?', @query + '%').limit(10).order('LENGTH(name) ASC')
  end
end
