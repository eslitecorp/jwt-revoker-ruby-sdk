# JwtRevoker

JwtRevoker 是一個提供檢查 JWT Token 是否已撤銷功能的 Ruby 客戶端

## Installation

在你的應用程式的 Gemfile 加上：
```
gem "jwt-revoker", git: "https://github.com/eslitecorp/jwt-revoker-ruby-sdk"
```
然後執行：
```
bundle install
```

## Usage

在應用程式初始化時設定（例如 Rails 的 `config/initializers/jwt_revoker.rb`）：
```ruby
JwtRevoker.configure do |config|
  config.endpoint = ENV.fetch("JWT_REVOKER_GRPC_SERVICE")
  # config.timeout = 1  # 選填，預設為 1 秒
end
```

建立 JWTRevoker 客戶端
```ruby
client = JwtRevoker::Client.new
```

檢查 token 是否已撤銷
```
token = "your token"
client.revoked?(token)
```

錯誤處理說明：
當驗證服務無法連線或發生異常時，需要自動略過 token 檢查，並預設 token 為有效，以避免影響整體服務可用性。

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eslitecorp/jwt-revoker-ruby-sdk.
