class RemoveLessonsFromPdfs < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pdfs, :lessons, null: false, foreign_key: true
  end
end
