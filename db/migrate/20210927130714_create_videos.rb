class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :video_nm
      t.string :video_link
      t.integer :video_len
      t.string :video_logo
      t.boolean :watched_status
      t.time :time_watched
      t.string :notes
      t.boolean :like
      t.boolean :dislike
      t.references :lessons, null: false, foreign_key: true

      t.timestamps
    end
  end
end
