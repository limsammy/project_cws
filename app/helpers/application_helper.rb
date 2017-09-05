module ApplicationHelper
  def companies_list(user)
  	user.company.all.map{ |a| a.name}
  end
end
