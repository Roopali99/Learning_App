class AddAccountToBoards < ActiveRecord::Migration[6.1]
  def change
    add_reference :boards, :account, null: false, foreign_key: true
  end
end
