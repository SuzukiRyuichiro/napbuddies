class ReviewsController < ApplicationController
  before_action :set_user, only: [:show, :new, :create ]
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.reviewee = @user
    @review.reviewer = current_user
    authorize @review
    if @review.save
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
