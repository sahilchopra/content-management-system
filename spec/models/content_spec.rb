require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:content) { create(:content, status: :published ) }
  let(:draft_content) { create(:content, status: :draft ) }
  
  it 'should have draft_content' do
    draft_content.update_attributes(status: :published)
    expect(draft_content.published_date).to eq(Date.today)
  end
  it 'should have method draft? published?' do
    allow_any_instance_of(Content.new.class).to receive(:draft?)
    allow_any_instance_of(Content.new.class).to receive(:published?)
  end
  it 'should have method as_json' do
    allow_any_instance_of(Content.new.class).to receive(:as_json)
  end
  it 'should return hash in to_json' do
    expect(JSON.parse(content.to_json)['title']).to eq(content.title)
  end
end
