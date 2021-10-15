class CustomersController < ApplicationController
  before_action :authenticate

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    return if current_user.CustomerSupport?

    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    return unless admin_users?

    @customer = Customer.find(params[:id])
  end

  def update
    return unless admin_users?

    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    return unless current_user.SuperAdmin?

    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_id, :name, :email, :group)
  end
end
