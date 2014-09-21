require 'spec_helper'

describe ServletsController do
  describe 'routes' do
    it 'to index' do
      expect(get('/servlets')).to route_to('servlets#index')
    end
    it 'to create' do
      expect(post('/servlets')).to route_to('servlets#create')
    end
  end
end