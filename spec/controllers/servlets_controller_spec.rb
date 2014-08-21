require 'rails_helper'

RSpec.describe ServletsController, :type => :controller do
  describe 'index' do
    before do
      get :index
    end
    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
    it { expect(assigns(:servlets)).to_not be_nil }
  end

  describe 'new' do
    before do
      get :new
    end
    it { expect(response).to be_success }
    it { expect(response).to render_template(:new) }
    it { expect(assigns(:servlet)).to_not be_nil }
  end
end
