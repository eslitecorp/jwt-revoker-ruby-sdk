# frozen_string_literal: true

# 此檔案為 Bundler 自動載入的橋接檔案。
#
# Bundler 預設會根據 gem 名稱來 require 同名檔案：
#   gem "jwt-revoker" → require "jwt-revoker"
#
# 但 Ruby 慣例使用底線命名，所以實際的程式碼在 jwt_revoker.rb。
# 此檔案的作用是將 require "jwt-revoker" 導向 require "jwt_revoker"。
# 加上這個橋接檔案，在使用這個 gem 時，Bundler 就能自動載入。

require_relative 'jwt_revoker'
