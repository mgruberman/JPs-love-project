# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run OmniauthDeviseExample::Application

Whatever::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Error] ",
  :sender_address => %{"notifier" <error@coffeecompass.com>},
  :exception_recipients => %w{thethirddan+Error@gmail.com}
