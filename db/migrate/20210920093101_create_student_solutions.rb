class CreateStudentSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :student_solutions do |t|
      t.boolean :ques_status
      t.string :option_selected
      t.boolean :status
      t.boolean :marked_later
      t.boolean :skip
      t.time :time_taken
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
