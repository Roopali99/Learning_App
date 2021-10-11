require 'rails_helper'
RSpec.describe Subject, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:standard) }
  it { should have_many(:lesso)}
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:subject_nm) }
end

