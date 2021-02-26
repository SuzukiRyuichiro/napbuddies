class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:id])
    @review = Review.new
    authorize @review
  end

  def create
    @user = User.find(params[:id])
    @review = Review.new(review_params)
    @review.user = @user
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
