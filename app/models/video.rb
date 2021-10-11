class Video < ApplicationRecord
  belongs_to :lesso
  validates_presence_of :video_nm
  validates_presence_of :video_link
  validates_presence_of :video_len
  validates_presence_of :video_logo
  validates_presence_of :watched_status
  validates_presence_of :time_watched
  validates_presence_of :notes
  validates_presence_of :like
  validates_presence_of :dislike
  
end