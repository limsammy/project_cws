module ApplicationHelper
  def companies_list(user)
  	user.company.all.map{ |a| a.name}
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y')
  end
  # def round_off(value)
  #   binding.pry
  #   "%.2f" % value
  # end

  def assign_dollar
    return "$"
  end
end
