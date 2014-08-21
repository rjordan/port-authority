require 'spec_helper'

describe ServletsController do
  describe 'routes' do
    it 'to index' do
      expect(get('/servlets')).to route_to('servlets#index')
    end
    it 'to new' do
      expect(get('/servlets/new')).to route_to('servlets#new')
    end
  end
end