class StudentSolution < ApplicationRecord
  belongs_to :question
  validates_presence_of :ques_status
  validates_presence_of :option_selected
  validates_presence_of :status 
  validates_presence_of :marked_later
  validates_presence_of :skip
  validates_presence_of :time_taken
  has_many :analytic
end
