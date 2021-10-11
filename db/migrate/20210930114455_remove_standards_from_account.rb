class RemoveStandardsFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_reference :accounts, :standard, null: false, foreign_key: true
  end
end
