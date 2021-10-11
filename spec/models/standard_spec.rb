require 'rails_helper'
# Test suite for the Item model
#puts("are u here in model specs")
RSpec.describe Standard, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:board) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:class_id) }
end
RSpec.describe Standard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
