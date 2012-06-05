class AddDonationUserIdToPaymentNotifications < ActiveRecord::Migration
  def change
    add_column :payment_notifications, :donation_user_id, :integer
  end
end
