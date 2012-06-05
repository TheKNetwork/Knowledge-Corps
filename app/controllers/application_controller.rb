class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_cart
    if session[:donation_id]
      @current_donation ||= DonationUser.find(session[:donation_id])
      session[:donation_id] = nil if @current_donation.purchased_at
    end
    if session[:donation_id].nil?
      @current_donation = DonationUser.create!
      session[:donation_id] = @current_donation.id
    end
    @current_donation
  end

end
