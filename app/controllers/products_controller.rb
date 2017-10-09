class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @product.order_items.build
  end

  def edit
  end


  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def per_amount
    item_in_stock = Product.find_by(id: params[:product]).stock_in_hand.to_f
    no_of_item = params[:id].to_f
    if item_in_stock >= no_of_item
      item_count = params[:id].to_f
    else
      item_count = -1
    end
    render json: {value: item_count }
  end

  def per_price

    unit_price = (Product.find_by(id: params[:id]).price.to_f).round(2)
    render json: {value: unit_price}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:id,:category_id, :name, :code, :customer_id, :price, :stock_in_hand,
                                    order_items_attributes: [
                                      :id,
                                      :unit_price,
                                      :quantity,
                                      :amount,
                                      :_destroy])
  end
end
