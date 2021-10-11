require 'rails_helper'
RSpec.describe Account, type: :model do  
  it { should has_many(:boards)}
  it { should validate_presence_of(:student_name) }
  it { should validate_presence_of(:mobile) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:otp) }
end
