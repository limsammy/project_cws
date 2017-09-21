module ApplicationHelper
  def companies_list(user)
  	user.company.all.map{ |a| a.name}
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y')
  end
  def round_off(value)
    "%.2f" % value
  end

  def assign_dollar
    return "$"
  end

  def country_select
    CS.get.map{|k,v| [v,k]}
  end

  def state_select(country)
    CS.get(:"#{country}").map{|k,v| [v,k]}
  end

  def city_select(country, state)
    CS.get(:"#{country}", :"#{state}").map{|k| [k,k]}
  end

  def order_number
    "ORDER-" + "#{Order.count + 1}"
  end
end
