require 'spec_helper'

describe ServletsController do
  describe 'routes' do
    it 'to index' do
      expect(get('/servlets')).to route_to('servlets#index')
    end
  end
end