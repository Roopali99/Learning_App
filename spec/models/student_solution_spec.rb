require 'rails_helper'
RSpec.describe StudentSolution, type: :model do
  it { should belong_to(:question) }
  it { should validate_presence_of(:ques_status) }
  it { should validate_presence_of(:option_selected) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:marked_later) }
  it { should validate_presence_of(:skip) }
  it { should validate_presence_of(:time_taken) }
  
end

