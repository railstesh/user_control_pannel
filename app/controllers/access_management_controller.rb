class AccessManagementController < ApplicationController
  before_action :authenticate

  def index
    @order_data = Order.all
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
