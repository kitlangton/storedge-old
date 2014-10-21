class UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to users_path
      flash[:success] = "Company destroyed"
    end
  end

  def index
    @users = User.all.page params[:page]
  end
end
