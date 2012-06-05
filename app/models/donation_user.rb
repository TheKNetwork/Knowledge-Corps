class DonationUser < ActiveRecord::Base
  attr_accessible :city, :donation_id, :valid
  validates :city, :presence => true
  belongs_to :donation
  has_one :payment_notification

  before_create :find_or_create_donation

  def paypal_url(return_url, notify_url)
    values = {
      :business => 'sina.z_1337973047_biz@hotmail.com', #Seller's email address
      :cmd => '_donations',
      :upload => 1,
      :return => return_url,
      :currency_code => "CAD",
      :item_name => "The KNetwork Donation",
      :notify_url => notify_url,
      :invoice => id,
      "amount" => 5
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.map{|k,v| "#{k}=#{v}"}.join("&")
  end


  def find_or_create_donation
    donation = Donation.find_or_create_by_city(self.city)
    self.donation = donation
  end
end
