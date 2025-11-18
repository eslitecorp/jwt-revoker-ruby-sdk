# frozen_string_literal: true

require_relative "../eslite/jwt_revoker/jwt_revoke/v1/jwt_revoke_services_pb"

module JwtRevoker
  # JWT Revoker gRPC Client
  class Client
    def initialize(config = JwtRevoker.config)
      @config = config
      # Using insecure channel for simplicity; 不使用 TLS/SSL 加密通訊
      @stub = Eslite::JwtRevoker::JwtRevoke::V1::JWTRevokerService::Stub.new(@config.endpoint, :this_channel_is_insecure, timeout: @config.timeout)
    end

    # Object <Eslite::JwtRevoker::JwtRevoke::V1::CheckRevokedResponse: revoked: false, jti: "d426bkom9u279f05reg0">
    def revoked?(token)
      request = Eslite::JwtRevoker::JwtRevoke::V1::CheckRevokedRequest.new(token: token)
      response = @stub.check_revoked(request)

      response.revoked
    rescue GRPC::BadStatus => e
      LOGGER.error("gRPC BadStatus: #{e.message}")

      false
    end
  end
end

