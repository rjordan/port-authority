require 'rails_helper'

RSpec.describe ImagesController, :type => :controller do
  let(:image) { FactoryGirl.build(:image) }
  before do
    allow(Docker::Image).to receive(:get).with(image.id).and_return(image)
  end

  describe 'index' do
    before do
      get :index
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:images)).to respond_to(:each) }
    it { expect(response).to render_template(:index) }
  end

  describe 'destroy' do
    before do
      expect(image).to receive(:remove)
      request.env['HTTP_REFERER'] = '/back'
      delete :destroy, id: image.id
    end
    it { expect(response).to redirect_to('/back') }
  end

end
