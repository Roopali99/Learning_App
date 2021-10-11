class DropuserAnswers < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_answers
  end
end
