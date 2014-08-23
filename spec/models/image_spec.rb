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
      index_data = double(id: '1', info: {'RepoTags'=>['test:1']} )
      allow(Docker::Image).to receive(:all).and_return([index_data])
      detail_data = double(id: '1', info: { 'Config' => { 'ExposedPorts'=>['80/tcp'], 'Volumes'=>['/data'] } })
      allow(Docker::Image).to receive(:get).with('1').and_return(detail_data)
      @image = Image.find(1)
    end
    it { expect(@image).to be_kind_of(Image) }
    it { expect(@image.id).to eq('1') }
    it { expect(@image.tags).to eq(['test:1']) }
    it { expect(@image.exposed_ports).to eq(['80/tcp']) }
    it { expect(@image.volumes).to eq(['/data']) }
  end

  describe '#delete' do
    before do
      data = double(id: '1')
      expect(data).to receive(:remove)
      allow(Docker::Image).to receive(:get).with('1').and_return(data)
      @result = Image.delete('1')
    end
    it { expect(@result).to be_truthy }
  end

end
