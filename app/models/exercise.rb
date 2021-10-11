class Exercise < ApplicationRecord
  belongs_to :lesso
  validates_presence_of :ex_no
  validates_presence_of :ex_status
  validates_presence_of :num_of_ques
  validates_presence_of :total_time
  validates_presence_of :start_time
  validates_presence_of :end_time
  has_many :question
end
