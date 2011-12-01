Twitter.configure do |config|
  @keys = APP_CONFIG['auth']['twitter'].to_options
  config.consumer_key = @keys[:client]
  config.consumer_secret = @keys[:secret]
  config.oauth_token = @keys[:token]
  config.oauth_token_secret = @keys[:token_secret]
end

