class RemoveBoardsFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_reference :accounts, :board, null: false, foreign_key: true
  end
end
