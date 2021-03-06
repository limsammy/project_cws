class HomeController < ApplicationController

  def dashboard
    @order_date = []
    @order_count = []
    @products_name = []
    @products_quantity = []
    @clients_name = []
    @clients_amount = []
    @client_total_amount = Order.select(' total_amount').order('total_amount DESC')
    @order_count = []
    @order_date
    order = Order.group_by_day(:ordered_at).count
    @order_count = order.values
    order.keys.each do |o|
      @order_date << o.to_datetime.strftime("%d/%m/%Y")
    end
    clients_orders = Client.joins(:orders).includes(:orders).group('name').sum("orders.total_amount")
    @clients_name = clients_orders.keys
    @clients_amount = clients_orders.map{|k,v| v.to_f.round(2)}
    products_ordered = Product.joins(:order_items).includes(:order_items).group('name').sum("order_items.quantity")
    @products_name = products_ordered.keys
    @products_quantity = products_ordered.values
  end
end
