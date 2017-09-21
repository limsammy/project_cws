class HomeController < ApplicationController

  def dashboard
    @order_date = []
    @order_count = []
    order = Order.group_by_day(:ordered_at).count
    @order_count = order.values
    order.keys.each do |o|
      @order_date << o.to_datetime.to_i
    end
    @order_date
  end
end
