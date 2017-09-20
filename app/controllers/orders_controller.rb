class OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.order_items.build
    @order.build_shipping_address
  end

  def edit
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end
  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:success]= "updated successfully"
      redirect_to order_path(@order)
    else
      render :edit
    end
  end
   def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :company_id, :client_id, :order_number, :ordered_at, :order_description,
                                   order_items_attributes: [
                                    :id,
                                    :product_id,
                                    :unit_price,
                                    :quantity,
                                    :amount,
                                    :_destroy],
                                   shipping_address_attributes: [
                                    :id,
                                    :line_1,
                                    :line_2,
                                    :country,
                                    :state,
                                    :zip,
                                    :city
                                    ])

  end

end
