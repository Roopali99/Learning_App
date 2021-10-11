class AddLessoToPdfs < ActiveRecord::Migration[6.1]
  def change
    add_reference :pdfs, :lesso, null: false, foreign_key: true
  end
end
