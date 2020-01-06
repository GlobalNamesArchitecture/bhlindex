# frozen_string_literal: true

describe Bhlindex::Client do
  let(:subject) { Bhlindex::Client.new }

  describe '.new' do
    it 'creates a new connection to bhlindex grpc service' do
      cl = Bhlindex::Client.new
      expect(cl).to be_kind_of(Bhlindex::Client)
    end

    it 'breaks if grpc service is too old' do
      stub_const('Bhlindex::Client::BHLINDEX_MIN_VERSION', 'v100.100.100')
      expect { Bhlindex::Client.new }
        .to raise_exception(/Download latest version/)
    end
  end

  describe '#version' do
    it 'returns version of bhlindex' do
      expect(subject.bhlindex_version.value).to match(/^v\d+\.\d+\.\d+/)
    end
  end

  describe '#titles' do
    it 'returns ids of titles' do
    end
  end
end
