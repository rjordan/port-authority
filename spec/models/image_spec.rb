require 'rails_helper'

RSpec.describe Image, :type => :model do
  describe '#all' do
    before do
      @response = Image.all
    end
    it { expect(@response).to be_kind_of(Array) }
  end

  describe '#find' do
    before do
      data = double(id: 1)
      expect(Docker::Image).to receive(:get).with(1).and_return(data)
      @image = Image.find(1)
    end
    it { expect(@image).to be_kind_of(Image) }
    it { expect(@image.id).to eq(1) }
  end
end
