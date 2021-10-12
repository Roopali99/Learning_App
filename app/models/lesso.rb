include ActiveModel::Serialization
class Lesso < ApplicationRecord
  
  belongs_to :subject
  validates_presence_of :chapter_nm
  validates_presence_of :video_count
  validates_presence_of :pdf_count
  has_many :exercises
  has_many :videos
  has_many :pdfs
end
