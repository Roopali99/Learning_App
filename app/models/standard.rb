class Standard < ApplicationRecord
  belongs_to :board
  has_many :subject
  has_many :chapter, through: :subject
  
  validates_presence_of :class_id
end
