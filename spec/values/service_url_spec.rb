require 'rails_helper'

describe ServiceUrl do
  describe '.from_url' do
    let(:service) { 'http://api.example.com/' }
    let(:version) { 'v2' }
    let(:path) { '/xxx' }
    let(:url) { "#{service}#{version}#{path}" }
    let(:service_url) { ServiceUrl.from_url(url) }

    describe '#service' do
      subject { service_url.service }
      it { is_expected.to eq service }
    end

    describe '#version' do
      subject { service_url.version }
      it { is_expected.to eq version }
    end
  end

  describe 'Comparable' do
    let(:obj) { ServiceUrl.from_url('http://api.com/v1/x') }
    let(:other) { ServiceUrl.from_url('http://api.com/v1/x') }

    it { expect(obj.better_than? other).to be false }
    it { expect(obj <=> other).to eq 0 }
    it { expect(obj.hash).to eq other.hash }
    it { expect(obj.eql? other).to be true }
  end
end
