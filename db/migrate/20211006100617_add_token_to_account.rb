class AddTokenToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :token, :varchar
  end
end
