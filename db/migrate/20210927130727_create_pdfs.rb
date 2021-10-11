class CreatePdfs < ActiveRecord::Migration[6.1]
  def change
    create_table :pdfs do |t|
      t.string :pdf_name
      t.string :pdf_link
      t.integer :pdf_length
      t.boolean :pdf_status
      t.integer :pdf_read_length
      t.references :lessons, null: false, foreign_key: true

      t.timestamps
    end
  end
end
