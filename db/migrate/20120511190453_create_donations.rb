class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :city
      t.string :state
      t.string :country
      t.float :amount

      t.timestamps
    end
  end
end
