class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "Your profile was saved!"
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio)
  end
end
