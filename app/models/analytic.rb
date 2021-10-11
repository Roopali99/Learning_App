class Analytic < ApplicationRecord
  belongs_to :exercise
  belongs_to :account
  validates_presence_of :total_ans_ampt, :correct_ans, :wrong_ans, :score, :accuracy, :speed, :time
end
