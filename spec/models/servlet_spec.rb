require 'rails_helper'

RSpec.describe Servlet, :type => :model do
  it { expect(subject).to have_db_column(:name) }
  it { expect(subject).to have_db_column(:image) }
  it { expect(subject).to have_db_index(:name).unique(true) }
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_uniqueness_of(:name) }
  it { expect(subject).to validate_presence_of(:image) }
  
  describe 'create' do
    subject { Servlet.new({"name"=>"redis", 
                           "image"=>"redis:latest", 
                           "ports"=>{"6379/tcp"=>"6379"}, 
                           "volumes"=>{"/data"=>"/docker-data/redis"}}) }
    it { expect(subject.name).to eq('redis') }
    it { expect(subject.image).to eq('redis:latest') }
    it { expect(subject.ports).to eq({"6379/tcp"=>"6379"}) }
    it { expect(subject.volumes).to eq({"/data"=>"/docker-data/redis"}) }
  end
end
