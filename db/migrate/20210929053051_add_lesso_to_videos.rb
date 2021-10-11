class AddLessoToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :lesso, null: false, foreign_key: true
  end
end
