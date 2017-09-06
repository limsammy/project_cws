class UsersController < ApplicationController

  def send_invitation
  end

  def create_invitation
    @user = User.invite!(email: params[:email], first_name: params[:first_name])
    redirect_to root_path
  end
end
