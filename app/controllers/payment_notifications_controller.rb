class PaymentNotificationsController < ApplicationController
  # GET /payment_notifications
  # GET /payment_notifications.json
  protect_from_forgery :except => [:create]
  def index
    PaymentNotification.create!(:params => params, :donation_user_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
  
  def create
    PaymentNotification.create!(:params => params, :donation_user_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
end
