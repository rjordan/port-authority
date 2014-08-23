require 'rails_helper'

RSpec.describe ServletsController, :type => :controller do
  describe 'index' do
    before do
      get :index
    end
    it { expect(response.status).to eq(200) }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:servlets)).to_not be_nil }
  end

  describe 'new' do
    before do
      image = FactoryGirl.build(:image)
      expect(Image).to receive(:find).with(image.id).and_return(image)
      get :new, image_id: image.id
    end
    it { expect(response.status).to eq(200) }
    it { expect(response).to render_template(:new) }
    it { expect(assigns(:servlet)).to be_kind_of(Servlet) }
    it { expect(assigns(:image)).to be_kind_of(Image) }
  end
end
