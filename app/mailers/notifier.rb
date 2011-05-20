class Notifier < ActionMailer::Base
   default :from => "from@coffeegetter.com"
   
   def welcome_email(user)
    #to call this:::
    #Notifier.welcome_email(@user).deliver
    @user = user
    @url  = "http://coffeegetter.com/login"
    mail(:to => user.email,
         :subject => "You Checked in!")
  end
end
