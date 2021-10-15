class AccessManagementController < ApplicationController
  before_action :authenticate

  def index
    @order_data = Order.all
  end
end
