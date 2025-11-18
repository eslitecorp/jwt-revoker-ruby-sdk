# frozen_string_literal: true

module JwtRevoker
  class Config
    attr_accessor :endpoint, :timeout

    def initialize
      @endpoint = ENV.fetch("JWT_REVOKER_GRPC_SERVICE")
      @timeout  = 1
    end
  end
end
