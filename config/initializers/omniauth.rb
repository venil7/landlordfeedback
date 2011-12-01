Rails.application.config.middleware.use OmniAuth::Builder do
  @keys = APP_CONFIG['auth'].to_options
  provider :twitter, @keys[:twitter]['client'], @keys[:twitter]['secret']
  provider :facebook, @keys[:facebook]['client'], @keys[:facebook]['secret']
  provider :google_oauth2, @keys[:google_oauth2]['client'], @keys[:google_oauth2]['secret']
end

