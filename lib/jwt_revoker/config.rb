# frozen_string_literal: true

module JwtRevoker
  class Config
    attr_accessor :endpoint, :timeout

    def initialize
      @endpoint = "" 
      @timeout  = 1
    end
  end
end
