class Donation < ActiveRecord::Base
  attr_accessible :amount, :city
  has_many :donation_users
end
