class CreatePaymentNotifications < ActiveRecord::Migration
  def change
    create_table :payment_notifications do |t|
      t.text :params
      t.integer :donation_id
      t.string :status

      t.timestamps
    end
  end
end
