class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video_nm, :video_link, :video_logo, :video_len
  belongs_to :lesso
  puts"VIDEO SERIALIZER"
end
