class MyMailer < ActionMailer::Base
  default from: "projectcws1@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email,subject: 'Welcome!')
  end
end
