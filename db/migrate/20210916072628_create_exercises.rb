class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.integer :ex_no
      t.boolean :ex_status
      t.integer :num_of_ques
      t.time :total_time
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
