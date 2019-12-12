# frozen_string_literal: true

describe Bhlindex::Client do
  let(:subject) { Bhlindex::Client.new }
  describe '#version' do
    it 'returns version of bhlindex' do
      expect(subject.bhlindex_version.value).to match(/^v\d+\.\d+\.\d+/)
    end
  end
end
