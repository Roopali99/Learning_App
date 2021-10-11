class RemoveContentFromExercise < ActiveRecord::Migration[6.1]
  def change
    remove_reference :exercises, :content, null: false, foreign_key: true
  end
end
