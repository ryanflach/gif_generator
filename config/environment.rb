# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Setup ActionMailer
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['email_username'],
  :password => ENV['email_password'],
  :domain => 'localhost.localdomain',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
