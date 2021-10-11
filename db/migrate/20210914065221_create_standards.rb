class CreateStandards < ActiveRecord::Migration[6.1]
  def change
    create_table :standards do |t|
      t.integer :class_id
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
