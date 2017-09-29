class OrdersController < ApplicationController


  def new
    @order = Order.new
    @order.order_items.build
    @order.build_shipping_address
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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

  def status
    @order = Order.find(params[:id])
    if @order.update_attributes(status: params[:status].to_i)
      render json: {status: @order.status}
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :customer_id, :contact_id, :order_number, :ordered_at, :description,
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
