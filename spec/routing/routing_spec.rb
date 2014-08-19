require 'spec_helper'

describe ImagesController do
  describe 'routes' do
    it 'to show' do
      expect(get('/images')).to route_to('images#index')
    end
  end
end