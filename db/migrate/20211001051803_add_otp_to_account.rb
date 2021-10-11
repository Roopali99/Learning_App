class AddOtpToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :otp, :integer
  end
end
