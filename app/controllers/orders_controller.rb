class OrdersController < ApplicationController

  def index
    @orders = Order.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @order = Order.new
    @order.order_items.build
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

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:success]= "updated successfully"
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :company_id, :client_id, :order_number, :order_at, :order_description,
                                   order_items_attributes: [
                                    :id,
                                    :product_id,
                                    :unit_price,
                                    :quantity,
                                    :amount,
                                    :_destroy,
                                    ])

  end

end
