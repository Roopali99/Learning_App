class RemoveLessonsFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_reference :videos, :lessons, null: false, foreign_key: true
  end
end
