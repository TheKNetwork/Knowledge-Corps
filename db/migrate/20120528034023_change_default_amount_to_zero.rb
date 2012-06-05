class ChangeDefaultAmountToZero < ActiveRecord::Migration
  def change
    change_column_default :donations, :amount, 0.0
  end
end
