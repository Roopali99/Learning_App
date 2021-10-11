require 'rails_helper'
RSpec.describe Analytic, type: :model do
 
  it { should belong_to(:account) }
  it { should belong_to(:exercise) }
 
  it { should validate_presence_of(:total_ans_ampt) }
  it { should validate_presence_of(:correct_ans) }
  it { should validate_presence_of(:wrong_ans) }
  it { should validate_presence_of(:score) }
  it { should validate_presence_of(:accuracy) }
  it { should validate_presence_of(:speed) }
  it { should validate_presence_of(:time) }
end 
