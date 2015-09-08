require 'rails_helper'

RSpec.describe ServletsController, :type => :controller do
  let(:image) { FactoryGirl.build(:image) }
  
  describe 'index' do
    before do
      get :index
    end
    it { expect(response.status).to eq(200) }
    it { expect(assigns(:servlets)).to respond_to(:each) }
    it { expect(response).to render_template(:index) }
  end

  describe 'new' do
    before do
      expect(Image).to receive(:find).with(image.id).and_return(image)
      get :new, image_id: image.id
    end
    it { expect(response.status).to eq(200) }
    it { expect(response).to render_template(:new) }
    it { expect(assigns(:servlet)).to be_kind_of(Servlet) }
    it { expect(assigns(:image)).to be_kind_of(Image) }
  end


  describe 'create' do
    before do
      post :create, "servlet"=>{"name"=>"redis", 
                                "image"=>"redis:latest", 
                                "ports"=>{"6379/tcp"=>"6379"}, 
                                "volumes"=>{"/data"=>"/docker-data/redis"}}
    end
    it { expect(response).to redirect_to(servlets_path) }
  end
end
