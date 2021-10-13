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
    @user = User.new(user_params)

    return unless @user.Customer_support?

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
    return unless can_update?
  end

  def update
    return unless can_update?

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    return unless @user.Super_Admin?

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

  def can_update?
    @user.Super_Admin? || @user.Admin?
  end

  def if_admins?
    current_user.Super_Admin? || current_user.Admin?
  end
end

