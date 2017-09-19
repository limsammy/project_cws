module ApplicationHelper
  def companies_list(user)
  	user.company.all.map{ |a| a.name}
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y')
  end
  def round_off(a)
    "%.2f" % a
  end

  def assign_dollar
    return "$"
  end
end
