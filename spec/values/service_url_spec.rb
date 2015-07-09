require 'rails_helper'

describe ServiceUrl do
  context 'URLから情報を生成する場合' do
    let(:service) { 'http://api.example.com/' }
    let(:version) { 'v2' }
    let(:path) { '/xxx' }
    let(:url) { "#{service}#{version}#{path}" }

    let(:service_url) { ServiceUrl.from_url(url) }

    it 'サービス名を取得できること' do
      expect(service_url.service).to eq service
    end

    it 'バージョンを取得できること' do
      expect(service_url.version).to eq version
    end
  end

  context 'Comparable' do
    let(:obj) { ServiceUrl.from_url('http://api.com/v1/x') }
    let(:other) { ServiceUrl.from_url('http://api.com/v1/x') }

    it { expect(obj.better_than? other).to be false }
    it { expect(obj <=> other).to eq 0 }
    it { expect(obj.hash).to eq other.hash }
    it { expect(obj.eql? other).to be true }
  end
end
