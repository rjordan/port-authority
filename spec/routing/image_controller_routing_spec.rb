require 'spec_helper'

describe ImagesController do
  describe 'routes' do
    it 'to show' do
      expect(get('/images')).to route_to('images#index')
    end
    it 'to delete' do
      expect(delete('/images/1')).to route_to('images#destroy', id: '1')
    end
    it 'to new servlet' do
      expect(get('/images/1/servlets/new')).to route_to('servlets#new', image_id: '1')
    end
  end
end