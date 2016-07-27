# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_xoSLpqdVKVDOHbapBLSzuAbe'],
   secret_key: ENV['sk_test_MjlvNzUEqd61863o03Ba4QW4']
}
 
# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]

