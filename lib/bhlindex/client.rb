# frozen_string_literal: true

module Bhlindex
  # Bhlindex::Client connects to remote bhlindex service. That allows remote
  # execution of its gRPC methods.
  class Client
    BHLINDEX_MIN_VERSION = 'v0.7.0'

    def initialize(host = 'bhlrpc.globalnames.org', port = 80)
      @stub = Protob::BHLIndex::Stub.new("#{host}:#{port}",
                                         :this_channel_is_insecure)
      return if bhlindex_version.value >= BHLINDEX_MIN_VERSION

      raise 'gRPC server of bhlindex should be at least ' \
            ' #{BHLINDEX_MIN_VERSION}.\n Download latest version from ' \
            'https://github.com/gnames/bhlindex/releases/latest.'
    end

    def bhlindex_version
      @stub.ver(Protob::Void.new)
    end
  end
end
