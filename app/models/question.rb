class Question < ApplicationRecord
  belongs_to :exercise
  validates_presence_of :ques_no
  validates_presence_of :ques
  validates_presence_of :option1
  validates_presence_of :option2
  validates_presence_of :option3
  validates_presence_of :option4
  validates_presence_of :time
  has_many :answer
  has_many :student_solution
end
