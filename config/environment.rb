# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['WINDOWSLIVE_USERNAME'],
  :password => ENV['WINDOWSLIVE_PASSWORD'],
  :domain => 'windowslive.com',
  :address => 'smtp.windowslive.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
