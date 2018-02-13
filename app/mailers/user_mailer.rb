class UserMailer < ActionMailer::Base
  default from: "linkvanproject@gmail.com"

  def welcome_email(user)
  	@url  = 'http://linkvan.ca'
    @user = user
    mail(to: @user.email,
    	subject: 'Welcome to LinkVan!')
  end

  def test_welcome_email
    mail(to: "f.tso11200@gmail.com",
         subject: 'Welcome to LinkVan!')
  end

  def new_message(message, user)
    @message = message
    @user = user


    mail(to: "info@linkvan.ca",
      subject: "Activation Request from #{@user.name}")

  end

  def simple_message
    mail(to: "f.tso11200@gmail.com",
      subject: "Activation Request from TEST")
  end
end
