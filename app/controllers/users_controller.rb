class UsersController < ApplicationController
  before_action :authenticate
  before_action :find_user, except: %w[index new create]

  def index
    @users = if_admins? ? User.all : User.where(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    return if current_user.Customer_support?

    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show; end

  def edit
    return unless if_admins?
  end

  def update
    return unless if_admins?

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    return unless current_user.Super_Admin?

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

  def if_admins?
    current_user.Super_Admin? || current_user.Admin?
  end
end
