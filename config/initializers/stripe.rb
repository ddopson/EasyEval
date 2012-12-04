Stripe.api_key = "sk_test_9apNfxhlmFafG3XVt2Kc0CmR"
STRIPE_PUBLIC_KEY = "pk_test_Qe9EmkEmIvylZdQd1rWAWGsX"

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end