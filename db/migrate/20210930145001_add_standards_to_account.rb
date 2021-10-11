class AddStandardsToAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :standard, null: false, foreign_key: true
  end
end
