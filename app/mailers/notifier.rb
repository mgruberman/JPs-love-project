class Notifier < ActionMailer::Base
   default :from => "from@coffeegetter.com"
   
   def welcome_email(user)
    @user = user
    @url  = "http://coffeegetter.com/login"
    mail(:to => user.email,
         :subject => "You Checked in!")
  end
end
