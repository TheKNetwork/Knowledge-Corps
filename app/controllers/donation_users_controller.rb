class DonationUsersController < ApplicationController


  def create
   # @donation = Donation.new(params[:donation])
    @donation_user = DonationUser.create({
      :city => params[:donation_user][:city]
    })

    session[:user_id] = @donation_user.id
    url = URI.encode(@donation_user.paypal_url(donations_url, payment_notifications_url))
    
    respond_to do |format|
      if @donation_user.save
        format.html { redirect_to url }# root_path, notice: 'Donation was successfully created but not validated.' }
        format.json { render json: @donation_user, status: :created, location: @donation_user }
      else
        format.html { redirect_to root_path  }
        format.json { render json: @donation_user.errors, status: :unprocessable_entity }
      end
    end
  end

end
