Rails.configuration.stripe = {
  :publishable_key => 'pk_test_CK7xtDhwGrsnhK32Vd5AFmdj',
  :secret_key      => 'sk_test_7l3laxlY3XUEho0KlrGXwL8P'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
