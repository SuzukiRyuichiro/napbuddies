class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @review = Review.new
  end

  def create
    @review = Review.new
  end
end
