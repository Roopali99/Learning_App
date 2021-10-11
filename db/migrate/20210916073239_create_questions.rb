class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :ques_no
      t.string :ques
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.time :time
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
