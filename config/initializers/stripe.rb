Rails.configuration.stripe do |config|

  config.publishable_key = ENV['stripe_publishable_key'] ||= Rails.application.secrets.stripe_publishable_key
  config.secret_key = ENV['stripe_api_key'] ||= Rails.application.secrets.stripe_secret_key

end


Stripe.api_key = Rails.configuration.stripe.publishable_key
