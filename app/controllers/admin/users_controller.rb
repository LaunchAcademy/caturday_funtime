class Admin::UsersController < ApplicationController
  before_filter :authorize!

  def index
    @members = User.where(role: 'member')
    @admins = User.where(role: 'admin')
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "You've successfully deleted this loser."
    else
      flash[:alert] = "Could not delete this loser."
    end

    redirect_to admin_users_path
  end
end
