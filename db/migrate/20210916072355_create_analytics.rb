class CreateAnalytics < ActiveRecord::Migration[6.1]
  def change
    create_table :analytics do |t|
      t.integer :total_ans_ampt
      t.integer :correct_ans
      t.integer :wrong_ans
      t.float :score
      t.float :accuracy
      t.integer :speed
      t.timestamp :time
      t.references :exercise, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
