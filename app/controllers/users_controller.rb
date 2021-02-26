class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]
  def show
    @reviews_from_guests = current_user.reviews_from_guests
    authorize @user
  end
  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :photo)
  end
end
