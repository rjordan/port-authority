require 'rails_helper'

RSpec.describe ImagesController, :type => :controller do

  describe 'index' do
    before do
      get :index
    end
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:images)).to_not be_nil }
  end

  describe 'destroy' do
    before do
      image = FactoryGirl.build(:image)
      expect(Docker::Image).to receive(:get).with(image.id).and_return(image)
      expect(image).to receive(:remove)
      request.env["HTTP_REFERER"] = '/back'
      delete :destroy, id: image.id
    end
    it { expect(response).to redirect_to('/back') }
  end

end
