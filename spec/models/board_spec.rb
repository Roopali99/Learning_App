require 'rails_helper'
# Test suite for the Todo model
RSpec.describe Board, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:standards).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:board_nm) }
  it { should validate_presence_of(:board_description) }
  it { should validate_presence_of(:board_logo) }
end
RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
