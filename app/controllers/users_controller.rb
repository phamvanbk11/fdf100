class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if User.exists? params[:id]
      @user = User.find params[:id]
    else
      flash[:danger] = t "flash.danger_message"
      redirect_to root_path
    end
  end
end
