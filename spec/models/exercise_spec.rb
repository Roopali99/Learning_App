require 'rails_helper'
# Test suite for the Item model
#puts("are u here in model specs")
RSpec.describe Exercise, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:lessos) }
  it { should has_many(:question) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:ex_no) }
  it { should validate_presence_of(:ex_status) }
  it { should validate_presence_of(:num_of_ques) }
  it { should validate_presence_of(:total_time) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end

