class HomeController < ApplicationController

  def dashboard
    @order_date = []
    @order_count = []
    @products_name = []
    @products_quantity = []
    @order_count = []
    order = Order.group_by_day(:ordered_at).count
    @order_count = order.values
    order.keys.each do |o|
      @order_date << o.to_datetime.strftime("%d/%m/%Y")
    end
    @order_date
    products_ordered = Product.joins(:order_items).includes(:order_items).group('name').sum("order_items.quantity")
    @products_name = products_ordered.keys
    @products_quantity = products_ordered.values
  end
end
