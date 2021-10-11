require 'rails_helper'
RSpec.describe Video, type: :model do
  it { should belong_to(:lesso) }
 
  it { should validate_presence_of(:video_nm) }
  it { should validate_presence_of(:video_link) }
  it { should validate_presence_of(:video_logo) }
  it { should validate_presence_of(:watched_status) }
  it { should validate_presence_of(:time_watched) }
  it { should validate_presence_of(:notes) }
  it { should validate_presence_of(:like) }
  it { should validate_presence_of(:dislike) }
end