class AddLessosToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :lessos, null: false, foreign_key: true
  end
end
