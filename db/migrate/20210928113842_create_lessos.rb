class CreateLessos < ActiveRecord::Migration[6.1]
  def change
    create_table :lessos do |t|
      t.string :chapter_nm
      t.integer :video_count
      t.integer :pdf_count
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
