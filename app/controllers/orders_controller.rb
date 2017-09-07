class OrdersController < ApplicationController
  def new
  	@order = Order.new
    @order.order_items.build

  end

  def create
    @order = Order.new(order_params) 
    if @order.save
    	redirect_to order_path(@order)
    else
    	render :new

    end
  end

  def show
  	@order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
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

  def index
    @orders = Order.all
  end


  private
  def order_params
    params.require(:order).permit(:id, :company_id, :client_id, :order_number,:order_description,
                                   order_items_attributes: [
                                    :id,
                                    :quantity,
                                    :amount,
                                    :_destroy,
                                    ])

  end

end
