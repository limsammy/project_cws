class UsersController < ApplicationController

  def send_invitation
  end

  def create_invitation
    @user = User.invite!(email: params[:email])
    redirect_to root_path
  end
end
