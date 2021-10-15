class ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    return if current_user.CustomerSupport?

    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    return unless admin_users?

    @product = Product.find(params[:id])
  end

  def update
    return unless admin_users?

    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    return unless current_user.SuperAdmin?

    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:product_id, :name, :sku, :weight, :size)
  end
end
