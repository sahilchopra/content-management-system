require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do

  render_views
  let(:json) { JSON.parse(response.body) }

  before(:each) do
    @content = create(:content, status: :published)
  end

  describe 'GET /contents' do
    let(:valid_attributes) { {page: 0 } }

    it "should list all Published contents" do
      get :index, format: :json, params: valid_attributes
      expect(response).to have_http_status(200)
      expect(json.count).to eq(1)
    end

  end


end
