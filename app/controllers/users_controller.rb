class UsersController < ApplicationController
  before_action :authenticate
  before_action :find_user, except: %w[index new create]

  def index
    @users = User.all
  end

  def show; end

  def edit
    return unless admin_users?
  end

  def update
    return unless admin_users?

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    return unless current_user.SuperAdmin?

    @user.destroy

    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role, :google_id)
  end
end
