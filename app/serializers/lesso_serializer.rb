class LessoSerializer < ActiveModel::Serializer
  # puts "serializers"
  attributes :id, :chapter_nm
  has_many :videos
  #render json: each_serializer: VideoSerializer
  # puts videos
end
