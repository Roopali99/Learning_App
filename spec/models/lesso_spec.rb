require 'rails_helper'
include ActiveModel::Serialization
RSpec.describe Lesso, type: :model do
  it { should belong_to(:subject) }
  it { should has_many(:exercise)}
  it { should has_many(:video)}
  
  it { should validate_presence_of(:chapter_nm) }
  it { should validate_presence_of(:video_count) }
  it { should validate_presence_of(:pdf_count) }
end

