class UsersController < ApplicationController

  def send_invitation
  end

  def create_invitation
    @user = User.invite!(email: params[:email])
    redirect_to root_path
  end

  def show
  end

  def edit
  end
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      render :show
    end
  end
  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :mob_no, :department, :email)
  end
end
