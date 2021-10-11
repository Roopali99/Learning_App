class Subject < ApplicationRecord
  belongs_to :standard
  validates_presence_of :subject_nm
  has_many :lessos
end
