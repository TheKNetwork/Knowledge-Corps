class CreateDonationUsers < ActiveRecord::Migration
  def change
    create_table :donation_users do |t|
      t.string :city
      t.integer :donation_id
      t.boolean :is_valid, :default => false

      t.timestamps
    end
  end
end
