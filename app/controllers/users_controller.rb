class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


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
    redirect_to root_path # or any other desired path
  else
    @user = User.find(params[:id])
  end
end

  
def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_url, notice: 'User was successfully destroyed.'
end

private

def user_params
  params.require(:user).permit(:admin, role_ids: [])
end


end
