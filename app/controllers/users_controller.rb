class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "User roles updated successfully."
    else
      render :edit
    end
  end

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    if params[:id] == "sign_out"
      sign_out current_user
      redirect_to root_path, notice: "You have been signed out successfully."
    else
      @user = User.find(params[:id])
    end
  end

  def sign_out_user
    sign_out current_user
    redirect_to root_path, notice: "You have been signed out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:admin, role_ids: [])
  end
end


