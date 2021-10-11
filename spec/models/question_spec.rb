require 'rails_helper'
RSpec.describe Question, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:exercise) }
  it { should has_many(:student_solution) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:ques_no) }
  it { should validate_presence_of(:ques) }
  it { should validate_presence_of(:option1) }
  it { should validate_presence_of(:option2) }
  it { should validate_presence_of(:option3) }
  it { should validate_presence_of(:option4) }
  it { should validate_presence_of(:time)  }
end
RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
