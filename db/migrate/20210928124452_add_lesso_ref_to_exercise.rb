class AddLessoRefToExercise < ActiveRecord::Migration[6.1]
  def change
    add_reference :exercises, :lesso, null: false, foreign_key: true
  end
end
