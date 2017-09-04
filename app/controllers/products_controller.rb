class ProductsController < ApplicationController
  include ApplicationHelper
  def new
    binding.pry
    @product = Product.new(company_id: current_user.company_id)
  end
  def create
    binding.pry
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    end
  end

  private
  def product_params
    params.require(:product).permit(:id, :company_id, :product_name, :code, :quantity, :last_order, :recorder_type)
  end
end
