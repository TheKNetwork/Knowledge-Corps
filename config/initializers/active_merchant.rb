# config/initializer/active_merchant.rb

if Rails.env.production? 
  PAYPAL_ACCOUNT = 'production.paypal.account@domain.com'
else
  PAYPAL_ACCOUNT = 'test.paypal.account@domain.com'
  ActiveMerchant::Billing::Base.mode = :test
end
