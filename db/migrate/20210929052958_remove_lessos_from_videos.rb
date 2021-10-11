class RemoveLessosFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_reference :videos, :lessos, null: false, foreign_key: true
  end
end
