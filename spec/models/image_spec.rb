require 'rails_helper'

RSpec.describe Image, :type => :model do
  let(:image) { double(id: '1', info: { 'RepoTags'=>['test:1'],
                                        'Config' => { 
                                          'ExposedPorts'=>{'80/tcp'=>{}}, 
                                          'Volumes'=>{'/data'=>{}} } }) }
  before do
    allow(Docker::Image).to receive(:get).with('1').and_return(image)
    allow(Docker::Image).to receive(:all).and_return([image])
  end

  describe '#all' do
    before do
      @response = Image.all
    end
    it { expect(@response).to be_kind_of(Array) }
  end

  describe '#find' do
    before do
      @image = described_class.find(1)
    end
    it { expect(@image).to be_kind_of(Image) }
    it { expect(@image.id).to eq('1') }
    it { expect(@image.tags).to eq(['test:1']) }
    it { expect(@image.exposed_ports).to eq(['80/tcp']) }
    it { expect(@image.volumes).to eq(['/data']) }
  end

  describe '#delete' do
    before do
      expect(image).to receive(:remove)
      @result = described_class.delete('1')
    end
    it { expect(@result).to be_truthy }
  end

end
